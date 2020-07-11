# frozen_string_literal: true

ActiveAdmin.register Player do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :age, :bio
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :age, :bio]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  show do
    attributes_table do
      row :name
      row 'image' do |ad|
        image_tag(ad.image, width: 200, height: 200) if ad.image.attached?
      end
      row :age
      row :bio
    end

    panel 'Фільми в яких знімався' do
      table_for player.movies do
        column :id
        column :name
        column :year
        column :rate
      end
    end
  end
end
