class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.belongs_to :event
      t.string :source

      t.timestamps
    end
  end
end
