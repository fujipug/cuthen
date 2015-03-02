class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string(:name, default: "")
      t.string :email, null: false
      t.string :title

      t.timestamps null: false
    end
  end

  def down
  	drop_table :users
  end
end
