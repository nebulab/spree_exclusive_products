Spree::Role.class_eval do
  has_and_belongs_to_many :variants
end
