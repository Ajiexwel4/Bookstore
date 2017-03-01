class Ability
  include CanCan::Ability

  def initialize(user)
    new_user = User.new
    user ||= new_user
    if user.admin?
      can :manage, :all
    else
      can :read, :all
      can :manage, User, id: user.id
      cannot :read, ActiveAdmin::Page, :name => "Dashboard"
      cannot :create, Review if new_user
    end
  end
end
