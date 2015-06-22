class CreateWarranties < ActiveRecord::Migration
  def change
    create_table :warranties do |t|
      t.integer :status
      t.date :expiration
      t.references :device, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
