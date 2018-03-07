class CreateAttendances < ActiveRecord::Migration[5.1]
  def change
    create_table :attendances do |t|
      t.integer :attendee_id
      t.integer :attended_id

      t.timestamps
    end
    add_index :attendances, :attendee_id
    add_index :attendances, :attended_id
    add_index :attendances, [:attendee_id, :attended_id], unique: true
  end
end
