class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table 'users', :force => true do |t|
      t.column :login,                     :string
      t.column :email,                     :string
      t.column :crypted_password,          :string, :limit => 40
      t.column :salt,                      :string, :limit => 40
      t.column :created_at,                :datetime
      t.column :updated_at,                :datetime
      t.column :remember_token,            :string
      t.column :remember_token_expires_at, :datetime
      t.column :activation_code, :string, :limit => 40
      t.column :activated_at, :datetime
      t.column :url, :string
      t.column :url_time, :datetime
    end

    add_index 'users', 'login'
    add_index 'users', 'email'
    add_index 'users', 'remember_token'
    add_index 'users', 'activation_code'
  end

  def self.down
    remove_index 'users', 'activation_code'
    remove_index 'users', 'remember_token'
    remove_index 'users', 'email'
    remove_index 'users', 'login'

    drop_table 'users'
  end
end
