require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:product) {create(:product)}

  it {is_expected.to belong_to(:category) }
  it {is_expected.to have_many(:photos) }
  it {is_expected.to validate_presence_of(:name) }
  it {is_expected.to validate_presence_of(:description) }
  it {is_expected.to validate_presence_of(:price) }
  it {is_expected.to validate_presence_of(:stock) }
end
