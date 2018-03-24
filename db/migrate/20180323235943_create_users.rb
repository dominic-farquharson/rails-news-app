class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :email
      t.string :password_digest
      t.string :session_token
    end

    # add index ( table name, column name)

    add_index :users, :email, unique: true
    add_index :users, :username, unique: true
    add_index :users, :session_token
  end
end
