class AbilityDecorator
  include CanCan::Ability
  def initialize(user)
    if user.respond_to?(:has_spree_role?) && user.has_spree_role?('admin')
      can :manage, :all
    else
      cannot :display, Spree::Variant
      can :display, Spree::Variant, Spree::Variant.exclusive_for(user.spree_role_ids) do |variant|
        variant.spree_roles.empty? || variant.spree_roles.any? { |spree_role| user.spree_roles.include? spree_role }
      end
    end
  end
end

Spree::Ability.register_ability(AbilityDecorator)
