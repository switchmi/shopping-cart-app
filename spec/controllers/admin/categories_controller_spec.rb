require 'rails_helper'

RSpec.describe Admin::CategoriesController, type: :controller do

  let(:admin) {create(:admin)}

  describe 'GET #new' do

    before do
      sign_in admin
      get :new
    end

    it { expect(assigns(:category)).to be_a_new(Category)}
  end

  describe 'POST #create' do

    context 'When save is successful' do
      let(:get_params) do
        {
          category: {
          name: 'Bag',
          description: 'Some description'
          }
        }
      end

      before do
        sign_in admin
        post :create, params: get_params
      end

      it {expect(Category.count).to eq(1)}
      it {is_expected.to redirect_to new_admin_category_path}
    end

    context 'When save is unsuccessful' do
      let(:get_params) do
        {
          category: {
          name: nil,
          description: 'Some description'
          }
        }
      end

      before do
        sign_in admin
        post :create, params: get_params
      end

      it {expect(Category.count).to eq(0)}
      it {is_expected.to render_template(:new)}
    end

  end

  describe 'GET #show' do

    before do
      sign_in admin
    end

    let(:category) { create(:category)}
    let!(:productone) { create(:product, category: category)}
    let!(:producttwo) { create(:product, category: category)}
    before {get :show, params: {name: category.name} }
    it {expect(assigns(:category)).to eq(category)}
    it {expect(assigns(:products).count).to eq(2)}
  end

end
