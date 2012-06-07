class AddProjectIndexToMicroposts < ActiveRecord::Migration
  def change
    change_table :microposts do |t|
      t.references :project
    end
    add_index :microposts, :project_id
  end
end
