class CreateGroupsSocieties < ActiveRecord::Migration
  def change
    create_table :group_societies, id: false do |t|
      t.belongs_to :group
      t.belongs_to :society
    end
  end
end