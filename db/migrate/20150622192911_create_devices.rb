class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :imei
      t.references :platform, index: true, foreign_key: true
      t.string :location
      t.string :email
      t.string :manager

      t.timestamps null: false
    end
  end
end
