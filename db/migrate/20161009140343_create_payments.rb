class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :subject_item, index: true, foreign_key: true, null: false
      t.references :student, index: true, foreign_key: true, null: false
      t.integer :month, null: false
      t.integer :year, null: false
      t.date :payment_date, null: false

      t.timestamps null: false
      t.index [:subject_item_id, :student_id, :month, :year],
        unique: true, name: 'unique_payment_index'
    end
  end
end
