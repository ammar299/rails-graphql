class Payment < ApplicationRecord
  belongs_to :recipient

  validates :amount, presence: true

  def self.create_with_idempotency_token(amount:, recipient:, token:)
    existing_payment = self.find_by(idempotency_token: token)
    return existing_payment if existing_payment

    payment = self.create(amount: amount, recipient: recipient, idempotency_token: token)
    return payment if payment.valid?

    raise StandardError, payment.errors.full_messages.join(', ')
  end
end
