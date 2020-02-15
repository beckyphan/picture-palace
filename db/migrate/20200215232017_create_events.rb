class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :event_title
      t.datetime :date_time
      t.belongs_to :movie, null: false, foreign_key: true
      t.belongs_to :host, null: false, foreign_key: false

      t.timestamps
    end
  end
end
