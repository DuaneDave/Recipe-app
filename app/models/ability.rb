# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.role == 'user'
      can [:read, :create], Recipe
      can [:read, :create], Food
      can [:update, :destroy], Recipe, user_id: user.id
    end
  end
end
