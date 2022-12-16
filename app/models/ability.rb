class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.admin?
      can :manage, :all
    elsif user.role == 'user'
      can %i[read create], Recipe
      can %i[read create], Food
      can %i[update destroy], Recipe, user_id: user.id
    end
  end
end
