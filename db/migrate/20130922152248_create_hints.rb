class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.belongs_to :challenge
      t.string :url
      t.timestamps
    end
  end
end
