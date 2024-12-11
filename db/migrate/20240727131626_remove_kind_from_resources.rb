class RemoveKindFromResources < ActiveRecord::Migration[7.0]
  def change
    remove_column :resources, :kind, :string
  end
end
