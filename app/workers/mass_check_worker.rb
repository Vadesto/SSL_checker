class MassCheckWorker
  include Sidekiq::Worker

  def perform
    Link.all.each do |link|
      CheckWorker.perform_async(link.id)
    end
  end
end
