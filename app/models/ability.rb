class Ability
  include CanCan::Ability

  def initialize(user)
    can :destroy, [Proposal, Comment], user_id: user.id
  end
end
