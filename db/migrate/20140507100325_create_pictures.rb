class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.belongs_to :events
      t.string :source

      t.timestamps
    end
  end
end
