ActiveAdmin.register Topic do
  # menu label: "Forum"

  form do |f|
    f.inputs "Topic" do
      f.input :category_id, :label => 'Category', :as => :select, :collection => Category.all.map{|u| [u.name, u.id]}
      f.input :topic_id, :label => 'Forum', :as => :select, :collection => Topic.all.map{|u| [u.name, u.id]}
      f.input :name
      f.input :description
      f.input :logged
    end
    f.actions
  end

  permit_params :category_id, :topic_id, :name, :description, :logged


end
