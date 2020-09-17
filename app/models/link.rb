class Link < ApplicationRecord
  enum status: {
    unchecked: 0,
    expired: 10,
    expires_in_two_weeks: 20,
    expires_in_one_week: 30,
    broken: 40,
    other: 50,
    good: 60
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
