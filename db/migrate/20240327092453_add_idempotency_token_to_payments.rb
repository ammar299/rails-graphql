class AddIdempotencyTokenToPayments < ActiveRecord::Migration[7.0]
  def change
    add_column :payments, :idempotency_token, :string
    add_index :payments, :idempotency_token, unique: true
  end
end
