class CreateBearers < ActiveRecord::Migration
  def change
    create_table :bearers do |t|
      t.belongs_to :society
      t.string :email
      t.string :name
      t.integer :phone
      t.string :role
      t.boolean :admin

      t.timestamps
    end
  end
end
