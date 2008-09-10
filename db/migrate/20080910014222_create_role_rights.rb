class CreateRoleRights < ActiveRecord::Migration
  def self.up
    create_table :role_rights do |t|
      t.integer :role_id
      t.integer :right_id

      t.timestamps
    end
  end

  def self.down
    drop_table :role_rights
  end
end
