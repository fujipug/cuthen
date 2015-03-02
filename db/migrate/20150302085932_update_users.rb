class UpdateUsers < ActiveRecord::Migration
  def up
    ## Database authenticatable
    change_column(:users, :email, :string, null: false, default: "")
    add_column(:users, :encrypted_password, :string, null: false, default: "")

    ## Recoverable
    add_column(:users, :reset_password_token, :string)
    add_column(:users, :reset_password_sent_at, :datetime)

    ## Rememberable
    add_column(:users, :remember_created_at, :datetime)

    ## Trackable
    add_column(:users, :sign_in_count, :integer, null: false, default: 0)
    add_column(:users, :current_sign_in_at, :datetime)
    add_column(:users, :last_sign_in_at, :datetime)
    add_column(:users, :current_sign_in_ip, :string)
    add_column(:users, :last_sign_in_ip, :string)

    ## Confirmable
    # t.string   :confirmation_token
    # t.datetime :confirmed_at
    # t.datetime :confirmation_sent_at
    # t.string   :unconfirmed_email # Only if using reconfirmable

    ## Lockable
    # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
    # t.string   :unlock_token # Only if unlock strategy is :email or :both
    # t.datetime :locked_at

    puts "*** add columns and updated email ***"

    add_index(:users, :email, unique: true)
    add_index(:users, :reset_password_token, unique: true)
    # add_index :auth_users, :confirmation_token,   unique: true
    # add_index :auth_users, :unlock_token,         unique: true

    puts "*** added index to email and reset password token ***"
  end
  def down
    puts "*** removing index from email and reset password token ***"
    remove_index(:users, :reset_password_token)
    remove_index(:users, :email)
    puts "*** finished removing indexes ***"
    puts "*** removing columns ***"
    remove_column(:users, :last_sign_in_ip)
    remove_column(:users, :current_sign_in_ip)
    remove_column(:users, :last_sign_in_at)
    remove_column(:users, :sign_in_count)
    remove_column(:users, :remember_created_at)
    remove_column(:users, :reset_password_sent_at)
    remove_column(:users, :reset_password_token)
    remove_column(:users, :encrypted_password)
    remove_column(:users, :current_sign_in_at)
    change_column(:users, :email, :string)
    puts "*** finished removing columns ***"
  end
end