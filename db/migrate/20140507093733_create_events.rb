class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.belongs_to :societies
      t.belongs_to :groups
      t.string :name
      t.string :type
      t.datetime :time
      t.string :location
      t.string :webpage
      t.string :condition
      t.text :description
      t.string :status
      t.string :string

      t.timestamps
    end
  end
end
