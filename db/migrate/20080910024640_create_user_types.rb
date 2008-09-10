class CreateUserTypes < ActiveRecord::Migration
  def self.up
    create_table :user_types do |t|
      t.integer :user_id
      t.integer :type_id

      t.timestamps
    end
  end

  def self.down
    drop_table :user_types
  end
end
