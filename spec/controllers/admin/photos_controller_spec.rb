# require 'rails_helper'
#
# RSpec.describe Admin::PhotosController, type: :controller do
#
#   let(:admin) {create(:admin)}
#
#   describe 'POST #create' do
#
#     before do
#       sign_in admin
#     end
#
#     let(:category) { create(:category)}
#     let(:product) { create(:product, category: category)}
#     before {post :create, params: {category_name: category.name, product_id: product.id} }
#     it {expect(assigns(:category)).to eq(category)}
#
#     # let(:product) { create(:product)}
#     # before {get :show, params: {id: product.id, category: category} }
#     # it {expect(assigns(:product)).to eq(product)}
#
#   end
#
# end
