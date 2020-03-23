class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_title
      t.datetime :date_time
      t.belongs_to :movie, null: false, foreign_key: true
      t.integer :host_id, null: false, foreign_key: true

      t.timestamps
    end
  end
end
