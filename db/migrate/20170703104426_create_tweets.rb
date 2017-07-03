class CreateTweets < ActiveRecord::Migration[4.2]
  def change
    create_table :tweets do |t|
      t.belongs_to :user, index: true, unique: true, foreign_key: true
      t.text :subject, null: false
      t.timestamps
    end
  end
end
