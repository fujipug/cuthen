class UpdateUsers < ActiveRecord::Migration
  def change
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

    add_index :users, :email, unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :auth_users, :confirmation_token,   unique: true
    # add_index :auth_users, :unlock_token,         unique: true

    puts "*** added index to email and reset password token ***"
  end
end