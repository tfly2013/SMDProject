class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :society
      t.string :name
      t.string :type
      t.date :date_begin
      t.date :date_end
      t.time :time_begin
      t.time :time_end
      t.string :location
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
