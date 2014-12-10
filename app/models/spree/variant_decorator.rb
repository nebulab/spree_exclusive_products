Spree::Variant.class_eval do
  has_and_belongs_to_many :roles
end
