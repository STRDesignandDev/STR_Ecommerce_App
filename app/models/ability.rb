class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, :all  # start by defining rules for all users, also not logged ones
    return unless user.present?
    can :manage, User, id: user.id # if the user is logged in can manage it's own id
    can :manage, Order, user_id: user.id # if the user is logged in can manage it's own orders
    can :create, Comment # logged in users can also create comments
    return unless user.admin?
    can :manage, :all # finally we give all remaining permissions only to the admins
  end
end
