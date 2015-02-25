ActiveAdmin.register User do
    index do
    selectable_column
    column :sign_in_count
    column :email
    column :name
    column :created_at
    column :admin
    column :image
    actions
  end
end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

