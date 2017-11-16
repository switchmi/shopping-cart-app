require 'rails_helper'

RSpec.describe PagesController, type: :controller do

  describe 'GET #home' do
    let!(:product) { create(:product) }
    before { get :home }
    it { expect(assigns(:products).count).to eq(1)}
  end

end
