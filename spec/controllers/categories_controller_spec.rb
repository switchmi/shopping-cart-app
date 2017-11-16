require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe 'GET #show' do
    let(:category) { create(:category)}
    let!(:productone) { create(:product, category: category)}
    let!(:producttwo) { create(:product, category: category)}
    before {get :show, params: {name: category.name} }
    it {expect(assigns(:category)).to eq(category)}
    it {expect(assigns(:products).count).to eq(2)}
  end
end
