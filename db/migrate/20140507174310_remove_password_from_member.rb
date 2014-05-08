class RemovePasswordFromMember < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.remove :password
    end
  end
end
