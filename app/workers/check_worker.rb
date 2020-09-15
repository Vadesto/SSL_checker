require 'net/http'
require 'openssl'

class CheckWorker
  include Sidekiq::Worker

  def perform(link_id)
    link = Link.find(link_id)
    uri = URI(link.url)
    response = Net::HTTP.start(uri.host, uri.port, :use_ssl => true)
    cert = response.peer_cert || nil

    week = 7 * 86400

    if cert == nil
      link.status = :broken
    elsif Time.now > cert.not_after
      link.status = :expired
    elsif Time.now + week > cert.not_after
      link.status = :expires_in_one_week
    elsif Time.now + (week*2) > cert.not_after
      link.status = :expires_in_two_weeks
    else
      link.status = :good
    end

    link.save
  end
end
