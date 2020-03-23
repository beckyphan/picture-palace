class RemoveStatusFromGuestlists < ActiveRecord::Migration[6.0]
  def change
    remove_column :guestlists, :status, :boolean
  end
end
