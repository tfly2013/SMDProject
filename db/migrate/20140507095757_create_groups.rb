class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :group_id
      t.integer :event_id

      t.timestamps
    end
  end
end
