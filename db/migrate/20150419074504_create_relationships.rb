class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :follower_id
      t.integer :friend_id

      t.timestamps null: false
    end
  end
end
