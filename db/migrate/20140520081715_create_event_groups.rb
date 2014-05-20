class CreateEventGroups < ActiveRecord::Migration
  def change
    create_table :event_groups, id: false do |t|
      t.belongs_to :group
      t.belongs_to :event
    end
  end
end
