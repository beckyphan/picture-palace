class CreateGuestlist < ActiveRecord::Migration[6.0]
  def change
    create_table :guestlist do |t|
      t.boolean :status, default: true
      t.belongs_to :event, null: false, foreign_key: true
      t.integer :attendee_id, null: false, foreign_key: true
      t.index [:attendee_id, :event_id]
    end
  end
end
