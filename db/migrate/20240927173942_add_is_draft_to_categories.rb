class AddIsDraftToCategories < ActiveRecord::Migration[7.0]
  def change
    add_column :categories, :is_draft, :boolean
  end
end
