class CreateTasks < ActiveRecord::Migration
  def self.up
    create_table :tasks do |t|
      t.integer :project_id
      t.string :name
      t.integer :requestor_id
      t.datetime :requested_at
      t.datetime :due_at
      t.datetime :expires_at
      t.integer :status_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tasks
  end
end
