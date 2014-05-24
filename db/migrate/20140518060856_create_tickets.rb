class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.belongs_to :event
      t.integer :total
      t.decimal :price

      t.timestamps
    end
  end
end
