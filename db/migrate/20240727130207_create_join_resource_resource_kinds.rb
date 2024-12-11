class CreateJoinResourceResourceKinds < ActiveRecord::Migration[7.0]
  def change
    create_table :join_resource_resource_kinds do |t|
      t.integer :resource_id
      t.integer :resource_kind_id

      t.timestamps
    end
  end
end
