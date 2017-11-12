require 'rails_helper'

RSpec.describe Photo, type: :model do

  let(:photo) {create(:photo)}

  it {is_expected.to belong_to(:product) }
  it {is_expected.to validate_presence_of(:url) }
end
