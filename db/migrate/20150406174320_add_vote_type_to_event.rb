class AddVoteTypeToEvent < ActiveRecord::Migration
  def change
    add_column :events, :votetype, :boolean, default: true
  end
end
