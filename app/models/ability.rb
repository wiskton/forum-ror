class Ability
  include CanCan::Ability
  def initialize(user)
    user ||= User.new

    # Define User abilities
    if user.is_admin?
      can :manage, Category
      can :manage, Topic
      can :manage, Post
      can :manage, User
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    elsif user.is_moderator?
      can :manage, Category
      can :manage, Topic
      can :manage, Post
      can :read, ActiveAdmin::Page, :name => "Dashboard"
    end
  end
end
