module Mutations
  class CreatePayment < GraphQL::Schema::Mutation
    argument :amount, Float, required: true
    argument :recipient_id, ID, required: true
    argument :idempotency_token, String, required: true

    field :payment, Types::PaymentType, null: true
    field :errors, [String], null: false

    def resolve(amount:, recipient_id:, idempotency_token:)
      recipient = Recipient.find_by(id: recipient_id)
      if recipient.nil?
        { payment: nil, errors: ['Recipient not found'] }
      else
        payment = Payment.create_with_idempotency_token(amount: amount, recipient: recipient, token: idempotency_token)
        if payment.persisted?
          { payment: payment, errors: [] }
        else
          { payment: nil, errors: payment.errors.full_messages }
        end
      end
    end
  end
end
