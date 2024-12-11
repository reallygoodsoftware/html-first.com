ActiveAdmin.register Resource do
  permit_params :title, :description, :url, :kind, :image, :x_url,
    join_resource_resource_kinds_attributes: [:id, :resource_kind_id, :_destroy],
    join_tag_resources_attributes: [:id, :tag_id, :_destroy]

  filter :resource_kinds

  index do 
    selectable_column
    column :id 
    column :title
    column :url 
    column :x_url
    column :kinds do |record|
      record.resource_kinds.map(&:name)
    end
    column :tags do |record|
      record.tags.map(&:name)
    end
    actions
  end

  form do |f|

    f.inputs do
      f.input :title, as: :string
      f.input :url, as: :string
      f.input :x_url, as: :string
      f.input :image, as: :file
      f.input :description
      f.has_many :join_resource_resource_kinds, allow_destroy: true do |jrr|
        jrr.input :resource_kind
      end
      f.has_many :join_tag_resources, allow_destroy: true do |jtr|
        jtr.input :tag
      end
    end
    f.actions
  end
end
