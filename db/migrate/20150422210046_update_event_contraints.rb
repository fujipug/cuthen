class UpdateEventContraints < ActiveRecord::Migration
  def change
  	change_column(:events, :name, :string, null: false, default: "nameless event")
  	change_column(:events, :duration, :integer, null: false, default: 0)
  end
end
