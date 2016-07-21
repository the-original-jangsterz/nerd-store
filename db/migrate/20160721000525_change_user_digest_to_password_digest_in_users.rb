class ChangeUserDigestToPasswordDigestInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :user_digest, :password_digest
  end
end
