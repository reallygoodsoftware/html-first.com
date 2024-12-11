class CreateJoinTagResources < ActiveRecord::Migration[7.0]
  def change
    create_table :join_tag_resources do |t|
      t.integer :tag_id
      t.integer :resource_id

      t.timestamps
    end
  end
end
