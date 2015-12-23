ActiveAdmin.register User do

  index do
    column :id, sortable: :title do |u|
      link_to u.id, admin_user_path(u)
    end
    column :name
    column :email
    column :get_user_permission
  end

  form do |f|
    f.inputs "User" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :permission, :label => 'Permission', :as => :select, :collection => { "Administrador" => 1, "Moderador" => 2, "Usuário" => 3 }
      f.input :block
      # How to get a value here, e.g. MyCode.find_by_person_id(p.id).code as above
      #f.input :code, :input_html => { :value => value??? }, as: :hidden
    end
    f.actions
  end

  permit_params :name, :email, :password, :password_confirmation, :permission, :block

end
