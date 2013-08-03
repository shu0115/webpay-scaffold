class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :user, index: true
      t.string :provider
      t.string :transaction_id
      t.string :object
      t.boolean :livemode
      t.string :currency
      t.string :description
      t.integer :amount
      t.integer :amount_refunded
      t.string :customer
      t.timestamp :created
      t.boolean :paid
      t.boolean :refunded
      t.text :failure_message
      t.boolean :captured

      t.timestamps
    end
  end
end
