class AddProjectIdToMicropost < ActiveRecord::Migration
  def change
    add_column :microposts, :project_id, :integer
  end
end
