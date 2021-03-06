# frozen_string_literal: true

ActiveAdmin.register Movie do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :year, :desc, :rat, :image

  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :year, :desc, :rat]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  filter :name
  filter :year
  filter :rate
  show do
    attributes_table do
      row :name
      row 'image' do |ad|
        image_tag(ad.image, width: 200, height: 200) if ad.image.attached?
      end
      row :rate
      row :year
      row :desc
    end

    panel 'Відгуки' do
      table_for movie.reviews do
        column :id
        column :user
        column :rate
        column :desc
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :year
      f.input :rat
      f.input :desc, as: :text
      f.input :image, as: :file
    end

    f.actions
  end
end
