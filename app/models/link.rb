class Link < ApplicationRecord
  enum status: {
    unchecked: 0,
    expired: 10,
    wrong_host: 20,
    self_signed: 30,
    untrusted_root: 40,
    revoked: 50,
    pinning_test: 60
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
    #TODO
  end
  #have to implement a validation for links!!
end
