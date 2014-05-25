class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.belongs_to :event
      t.string :name
      t.timestamps
    end
  end
end
