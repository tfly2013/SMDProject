class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.belongs_to :member
      t.belongs_to :society
      t.string :role

      t.timestamps
    end
  end
end
