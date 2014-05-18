class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.belongs_to :member
      t.belongs_to :ticket
      t.integer :quantity
      t.string :status

      t.timestamps
    end
  end
end
