class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new(role: 2)
    if user.admin?
        can :manage, :all
    elsif user.client?
        can :read, :all
        can :create, :all
        can :update, [Product, Review]
        can :destroy, Review, user_id: user.id
        #can [:set_genre, :set_genres], Movie
        #can :like, [Movie, Review]
    else
        can :read, :all
    end

  end
end
