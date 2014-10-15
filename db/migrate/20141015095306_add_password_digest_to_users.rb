class AddPasswordDigestToUsers < ActiveRecord::Migration
  def up
  	remove_column "users", "password"
  	add_column "users", "password_digest", :string
  	add_column "users", "username", :string, :limit =>40

  end

  def down
  	remove_column "users", "password_digest", :string
  	add_column "users", "password", :string, :limit => 40
  	remove_column "users", "username"
  end
end
