module Types
  class PaymentType < GraphQL::Schema::Object
    field :id, ID, null: false
    field :amount, Float, null: false
    field :recipient, Types::RecipientType, null: false
  end
end