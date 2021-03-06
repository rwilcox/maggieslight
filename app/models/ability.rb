class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
       user ||= User.new # guest user (not logged in)
       if user.is_admin?
         can :manage, :all
         can :access,:rails_admin
         can :dashboard
       elsif user.is_user?
         can :read, :all

         can :update, CareProviderProfile do |p|
            p.try(:user) == user
         end

         can :update, CareReceiverProfile do |p|
            p.try(:user) == user
         end

         can :update, EmploymentSurvey do |p|
            p.try(:user) == user
         end

         can :update, VolunteerOpportunity do |p|
            p.try(:user) == user
         end

         can :destroy, VolunteerOpportunity do |p|
            p.try(:user) == user
         end

         can :destroy, CareProviderProfile do |p|
            p.try(:user) == user
         end

         can :destroy, CareReceiverProfile do |p|
            p.try(:user) == user
         end

         can :update, User do |p|
            p.try(:user) == user
         end

         can :flag, CareProviderProfile do |p|
            p.try(:user) != user
         end

         can :flag, CareReceiverProfile do |p|
            p.try(:user) != user
         end

         can :flag, VolunteerOpportunity do |p|
            p.try(:user) == user
         end

         can :create, [CareProviderProfile, CareReceiverProfile, EmploymentSurvey, VolunteerOpportunity]
       else
         can :index, [CareProviderProfile, CareReceiverProfile, VolunteerOpportunity]
       end
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
