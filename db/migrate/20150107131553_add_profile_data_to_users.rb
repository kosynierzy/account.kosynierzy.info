class AddProfileDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :address, :text
    add_column :users, :personal_identity_number, :string
    add_column :users, :phone_number, :string
    add_column :users, :identity_card_number, :string
  end
end
