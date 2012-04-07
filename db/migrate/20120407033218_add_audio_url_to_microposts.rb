class AddAudioUrlToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :url, :string
  end
end
