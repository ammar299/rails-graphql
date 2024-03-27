class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.float :amount
      t.references :recipient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
