class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :name
      t.integer :register_num
      t.string :website
      t.text :description
      t.string :president
      t.integer :members_count

      t.timestamps
    end
  end
end
