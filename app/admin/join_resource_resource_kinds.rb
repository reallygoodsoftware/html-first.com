ActiveAdmin.register JoinResourceResourceKind do
  permit_params :resource_id, :resource_kind_id

  form do |f|

    f.inputs do
      f.input :resource
      f.input :resource_kind
    end
    f.actions
  end
end
