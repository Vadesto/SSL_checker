class Link < ApplicationRecord
  enum status: {
    unchecked: 0,
    expired: 10,
    wrong_host: 20,
    self_signed: 30,
    untrusted_root: 40,
    revoked: 50,
    pinning_test: 60,
    expires_in_two_weeks: 80,
    expires_in_one_week: 90,
    broken: 100,
    good: 110
  }

  validates :url,
    presence: true,
    uniqueness: true

  validates :status, presence: true

  after_commit :check_ssl, on: [:create]

  def current_status
    status
  end

  private

  def check_ssl
    CheckWorker.perform_async(self.id)
  end
  #have to implement a validation for links!!
end
