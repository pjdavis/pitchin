class CreateProjectContacts < ActiveRecord::Migration
  def self.up
    create_table :project_contacts do |t|
      t.integer :contact_id
      t.integer :project_id

      t.timestamps
    end
  end

  def self.down
    drop_table :project_contacts
  end
end
