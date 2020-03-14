class AddOmniauthToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :omniauth, :boolean, default: false
  end
end
