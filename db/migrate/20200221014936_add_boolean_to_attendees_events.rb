class AddBooleanToAttendeesEvents < ActiveRecord::Migration[6.0]
  def change
    add_column :attendees_events, :status, :boolean, default: false
  end
end
