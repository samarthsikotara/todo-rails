class AddedUsers < ActiveRecord::Migration[5.0]
  def change
  	create_table(:users) do |t|
      ## Database authenticatable
      t.uuid :uuid, default: "uuid_generate_v4()"
      t.string :name
      t.string :email,              null: false, default: ""
      t.string :password_hash
      t.string :password_salt
      t.integer :phone_number, limit: 8

      ## Rememberable
      t.datetime :remember_created_at
      t.boolean  :admin, default: false
      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :phone_number, unique: true
  
  end
end