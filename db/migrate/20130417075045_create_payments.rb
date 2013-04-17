class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.string :credit_card_number

      t.timestamps
    end
  end
end
