class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.integer :socrates_id
      t.string :name, null: false
      t.string :email, null: false
      t.string :gravatar
      t.timestamps
    end
  end
end
