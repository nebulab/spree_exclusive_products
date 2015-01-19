class VariantsToRoles < ActiveRecord::Migration
  create_table :spree_roles_variants, id: false do |t|
    t.references :role
    t.references :variant
  end
end
