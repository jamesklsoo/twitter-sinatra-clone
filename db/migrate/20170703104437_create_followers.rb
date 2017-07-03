class CreateFollowers < ActiveRecord::Migration[4.2]
  def change
    create_table :followers do |t|
      t.integer :user_id_following, index: true
      t.integer :user_id_followed, index:true
    end
  end
end
