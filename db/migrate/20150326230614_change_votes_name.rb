class ChangeVotesName < ActiveRecord::Migration
  def change
    rename_column :votes, :end, :end_time
  end
end
