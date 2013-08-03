class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :user, index: true
      t.string :object
      t.integer :exp_year
      t.integer :exp_month
      t.string :fingerprint
      t.string :name
      t.string :country
      t.string :kind
      t.string :cvc_check
      t.string :last_four_number

      t.timestamps
    end
  end
end
