Spree::Variant.class_eval do
  has_and_belongs_to_many :spree_roles,
                          join_table: 'spree_roles_variants',
                          foreign_key: 'variant_id',
                          class_name: 'Spree::Role'

  scope :exclusive_for, -> (spree_role_ids) { joins(:spree_roles).where(spree_roles: { id: spree_role_ids }) }
end
