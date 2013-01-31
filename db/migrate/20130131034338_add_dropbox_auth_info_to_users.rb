class AddDropboxAuthInfoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dropbox_access_secret, :string
    add_column :users, :dropbox_access_key, :string
  end
end
