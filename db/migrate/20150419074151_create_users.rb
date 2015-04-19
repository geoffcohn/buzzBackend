class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.integer :phonenumber
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps null: false
    end
  end
end
