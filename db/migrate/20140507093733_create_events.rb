class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :society
      t.string :name
      t.string :type
      t.datetime :begin_time
      t.datetime :end_time
      t.string :location
      t.string :webpage
      t.string :condition
      t.text :description
      t.string :status

      t.timestamps
    end
  end
end
