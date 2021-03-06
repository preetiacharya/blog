class Ability
  include CanCan::Ability
  #user not logged in
  def initialize(user)

    if user.nil?
      can :read, [Article, Category, Comment]
    elsif user.role? "admin"
      can :manage, [Article, Category, User, Comment]
      can [:create, :read, :update], Role
    elsif user.role? "author"
      can [:read, :create], [Article, Category, Comment]
      can [:update, :destroy], Article do |article|
        article.user == user
      end
      can [:update, :destroy], Comment do |comment|
        comment.article.user == user
      end
    elsif user.role? "moderator"
      can [:read, :update], [Article]
      can :manage, [Comment]
    elsif user.role? "user"
      can :read, [Article, Category, Comment]
      can :update, Comment do |comment|
        comment.user == user
      end
    end


    # :create, :read, :update, :destroy
    # :create - new/ create
    # :read - index/ show
    # :update - edit/ update
    # :destroy - destroy

    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
