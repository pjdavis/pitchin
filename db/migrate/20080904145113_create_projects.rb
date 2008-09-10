class CreateProjects < ActiveRecord::Migration
  def self.up
    create_table :projects do |t|
      t.string :name
      t.string :description
      t.text :details
      t.string :location
      t.integer :contact_id
      t.datetime :event_date

      t.timestamps
    end
  end

  def self.down
    drop_table :projects
  end
end
