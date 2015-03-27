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
    add_column(:users, :confirmation_token, :string)
    add_column(:users, :confirmed_at, :datetime)
    add_column(:users, :confirmation_sent_at, :datetime)
    add_column(:users, :unconfirmed_email, :string) #Only if using reconfirmable, :string)

    ## Lockable
    add_column(:users, :failed_attempts, :integer, null: false, default: 0) #Only if lock strategy #is :failed_attempts, :integer)
    add_column(:users, :unlock_token, :string) #Only if unlock strategy is :email or :both, #:string)
    add_column(:users, :locked_at, :datetime)

    puts "*** add columns and updated email ***"

    add_index(:users, :email, unique: true)
    add_index(:users, :reset_password_token, unique: true)
    add_index(:users, :confirmation_token, unique: true)
    add_index(:users, :unlock_token, unique: true)

    puts "*** added index to email and reset password token ***"
  end
  def down
    puts "*** removing index from email and reset password token ***"
    remove_index(:users, :unlock_token)
    remove_index(:users, :confirmation_token)
    remove_index(:users, :reset_password_token)
    remove_index(:users, :email)
    puts "*** finished removing indexes ***"
    puts "*** removing columns ***"

    remove_column(:users, :locked_at)
    remove_column(:users, :unlock_token)
    remove_column(:users, :failed_attempts)
    remove_column(:users, :unconfirmed_email)
    remove_column(:users, :confirmation_sent_at)
    remove_column(:users, :confirmed_at)
    remove_column(:users, :confirmation_token)
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