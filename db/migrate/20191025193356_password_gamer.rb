class PasswordGamer < ActiveRecord::Migration
  def change
    add_column :gamers, :password_digest, :string
  end
end
