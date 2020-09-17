require 'net/http'
require 'openssl'

class CheckWorker
  include Sidekiq::Worker

  def perform(link_id)
    link = Link.find(link_id)
    uri = URI(link.url)

    begin
      response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true)
      cert = response.peer_cert || nil

      week = 7 * 86400

      if cert == nil
        link.status = :other
      elsif Time.now + week > cert.not_after
        link.status = :expires_in_one_week
      elsif Time.now + (week*2) > cert.not_after
        link.status = :expires_in_two_weeks
      else
        link.status = :good
      end
    rescue OpenSSL::SSL::SSLError => e
      if e.message.include? "expired"
        link.status = :expired
      else
        link.status = :broken
      end
    end

    link.save
  end
end
