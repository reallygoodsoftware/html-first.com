class CreateResources < ActiveRecord::Migration[7.0]
  def change
    create_table :resources do |t|
      t.text :title
      t.text :description
      t.text :url
      t.string :kind

      t.timestamps
    end
  end
end
