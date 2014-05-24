class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :member
      t.belongs_to :event
      t.integer :quantity

      t.timestamps
    end
  end
end
