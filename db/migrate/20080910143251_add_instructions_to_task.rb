class AddInstructionsToTask < ActiveRecord::Migration
  def self.up
    add_column :tasks, :instructions, :text
  end

  def self.down
    remove_column :tasks, :instructions
  end
end
