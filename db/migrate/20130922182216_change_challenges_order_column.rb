class ChangeChallengesOrderColumn < ActiveRecord::Migration
  def up
    add_column :challenges, :challenge_order, :integer
  end

  def down
    remove_column :challenges, :order, :integer
  end
end
