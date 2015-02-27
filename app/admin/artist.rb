ActiveAdmin.register Artist do
  permit_params :name, :birthdate, :death_date, :description

   form do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :description
      f.input :birthdate, as: :datepicker
      f.input :death_date,   as: :datepicker
    end
    f.actions
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



end
