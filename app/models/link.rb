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

  validates :name,
    presence: true,
    uniqueness: true

  validates :status, presence: true

  #have to implement a validation for links!!
end
