class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :manage, Payment, author: user
    can :manage, Category, user: user
  end
end
