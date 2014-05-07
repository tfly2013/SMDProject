class CreateGroupsSocieties < ActiveRecord::Migration
  def change
    create_table :groups_societies, id: false do |t|
      t.belongs_to :groups
      t.belongs_to :societies
    end
  end
end