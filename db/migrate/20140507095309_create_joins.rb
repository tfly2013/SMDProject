class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.belongs_to :members
      t.belongs_to :societies
      t.string :role

      t.timestamps
    end
  end
end
