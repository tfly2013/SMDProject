class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.integer :event_id
      t.decimal :price
      t.string :purchase_location
      t.datetime :strat_time
      t.datetime :valid_time

      t.timestamps
    end
  end
end
