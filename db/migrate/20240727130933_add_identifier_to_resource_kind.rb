class AddIdentifierToResourceKind < ActiveRecord::Migration[7.0]
  def change
    add_column :resource_kinds, :identifier, :string
  end
end
