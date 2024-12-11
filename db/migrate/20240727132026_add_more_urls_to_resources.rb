class AddMoreUrlsToResources < ActiveRecord::Migration[7.0]
  def change
    add_column :resources, :x_url, :text
  end
end
