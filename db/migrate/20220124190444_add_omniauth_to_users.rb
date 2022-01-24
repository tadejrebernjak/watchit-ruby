class AddOmniauthToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :socialpfp, :string
    add_column :users, :uid, :string
  end
end
