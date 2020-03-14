class CreateGuestlists < ActiveRecord::Migration[6.0]
  def change
    create_table :guestlists do |t|
      t.boolean :status, default: true
      t.belongs_to :event, null: false, foreign_key: true
      t.integer :attendee_id, null: false, foreign_key: true
    end
  end
end
