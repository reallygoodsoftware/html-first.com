ActiveAdmin.register JoinTagResource do
  permit_params :resource_id, :tag_id

  form do |f|

    f.inputs do
      f.input :resource
      f.input :tag
    end
    f.actions
  end
end
