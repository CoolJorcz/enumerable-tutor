class AddSocratesIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :socrates_id, :integer
  end
end
