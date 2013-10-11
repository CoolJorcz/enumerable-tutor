class CreateHints < ActiveRecord::Migration
  def change
    create_table :hints do |t|
      t.belongs_to :challenge
      t.string :method
      t.text :html
      t.timestamps
    end
  end
end
