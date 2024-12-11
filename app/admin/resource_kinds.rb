ActiveAdmin.register ResourceKind do
  permit_params :name, :identifier

  form do |f|

    f.inputs do
      f.input :name, as: :string
      f.input :identifier
    end
    f.actions
  end
end
