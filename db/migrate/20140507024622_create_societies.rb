class CreateSocieties < ActiveRecord::Migration
  def change
    create_table :societies do |t|
      t.string :name
      t.integer :register_num
      t.string :website
      t.text :description
      t.attachment :logo
      
      t.timestamps
    end
  end
end
