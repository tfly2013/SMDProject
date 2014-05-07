class CreateJoins < ActiveRecord::Migration
  def change
    create_table :joins do |t|
      t.integer :member_id
      t.integer :society_id
      t.string :role

      t.timestamps
    end
  end
end
