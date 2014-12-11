require 'spec_helper'

module Spree
  feature 'Exclusive variants on product page' do

    let(:role_a) { create(:role, name: 'exclusive_a') }
    let(:role_b) { create(:role, name: 'exclusive_b') }

    let(:product) { create(:base_product) }

    let!(:generic_variant) { create(:base_variant, product: product) }
    let!(:exclusive_variant_for_user) { create(:base_variant, product: product, spree_roles: [role_a]) }
    let!(:exclusive_variant_for_other) { create(:base_variant, product: product, spree_roles: [role_b]) }

    before do
      allow_any_instance_of(Spree::ProductsController).to receive_messages(try_spree_current_user: user)
      visit spree.product_path(product)
    end

    context 'Given I am a store user' do

      let(:user) { create(:user, spree_roles: [role_a]) }

      scenario 'I want to see exclusive variants assigned to me' do
        expect(page).to have_selector("input#variant_id_#{exclusive_variant_for_user.id}")
      end

      scenario 'I want to see the generic variants' do
        expect(page).to have_selector("input#variant_id_#{generic_variant.id}")
      end

      scenario "I can not see exclusive variants not assigned to me" do
        expect(page).to_not have_selector("input#variant_id_#{exclusive_variant_for_other.id}")
      end
    end

    context 'Given I am an admin' do

      let(:user) { create(:admin_user) }

      scenario 'I want to see all variants' do
        expect(page).to have_selector("input#variant_id_#{exclusive_variant_for_user.id}")
        expect(page).to have_selector("input#variant_id_#{generic_variant.id}")
        expect(page).to have_selector("input#variant_id_#{exclusive_variant_for_other.id}")
      end
    end

    context 'Given I am a guest' do

      let(:user) { nil }

      scenario 'I want to see only generic variants' do
        expect(page).to have_selector("input#variant_id_#{generic_variant.id}")
        expect(page).to_not have_selector("input#variant_id_#{exclusive_variant_for_user.id}")
        expect(page).to_not have_selector("input#variant_id_#{exclusive_variant_for_other.id}")
      end
    end
  end
end
