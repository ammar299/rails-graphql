# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_payment, mutation: Mutations::CreatePayment
  end
end
