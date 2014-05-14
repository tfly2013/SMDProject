class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :members
      t.belongs_to :events
      t.text :content

      t.timestamps
    end
  end
end
