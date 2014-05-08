class AddEncryptedPasswordAndSaltToMembers < ActiveRecord::Migration
  def change
    change_table :members do |t|
      t.string :encrypted_password
      t.string :salt
    end
  end
end
