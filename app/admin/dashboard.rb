ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    #
    # div class: "blank_slate_container", id: "dashboard_default_message" do
    #   span class: "blank_slate" do
    #     span I18n.t("active_admin.dashboard_welcome.welcome")
    #     small I18n.t("active_admin.dashboard_welcome.call_to_action")
    #   end
    # end

    columns do
      column do
        panel "Info" do
          para "Welcome to Admin."
        end
      end
    end

    columns do

      column do
        panel "Users" do
          span class: "dashboard-total" do
            User.all.count
          end
        end
      end
      column do
        panel "Posts" do
          span class: "dashboard-total" do
            Comment.all.count - Post.all.count
          end
        end
      end
      column do
        panel "Topics" do
          span class: "dashboard-total" do
            Post.all.count
          end
        end
      end
      column do
        panel "Forums" do
          span class: "dashboard-total" do
            Topic.all.count
          end
        end
      end
      column do
        panel "Categories" do
          span class: "dashboard-total" do
            Category.all.count
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    columns do
      column do
        panel "Recent Users" do
          ul do
            User.all.order('created_at DESC').last(10).map do |user|
              li link_to(user.name, admin_user_path(user))
            end
          end
        end
      end
      column do
        panel "Recent Topics" do
          ul do
            Post.all.order('created_at DESC').last(10).map do |post|
              li link_to(post.name, admin_post_path(post))
            end
          end
        end
      end
      column do
        panel "Recent Posts" do
          ul do
            Comment.all.order('created_at DESC').last(10).map do |comment|
              li link_to(truncate(comment.content, :length => 60), admin_comment_path(comment))
            end
          end
        end
      end
    end


  end # content
end
