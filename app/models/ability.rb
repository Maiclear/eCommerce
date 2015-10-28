class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: 2)
    if user.admin?
        can :manage, :all
    elsif user.client?
        can :read, :all
        can :create, Review
        can :update, Review, user_id: user.id
        can :destroy, Review, user_id: user.id
        #can [:set_category, :set_category], Product
        can :like, [Product, Review]
    else
        can :read, :all
    end

  end
end
