class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :first_name
      t.string :last_name
      t.string :work_phone
      t.string :mobile_phone
      t.string :home_phone
      t.string :email1
      t.string :email2

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
