require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe 'GET #show' do
    let(:product) { create(:product)}
    let!(:photoone) { create(:photo, product: product)}
    let!(:phototwo) { create(:photo, product: product)}
    before {get :show, params: {id: product.id} }
    it {expect(assigns(:product)).to eq(product)}
    it {expect(assigns(:photos).count).to eq(2)}
  end

end
