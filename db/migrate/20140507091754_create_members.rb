class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.integer :student_id
      t.integer :phone
      t.string :status

      t.timestamps
    end
  end
end
