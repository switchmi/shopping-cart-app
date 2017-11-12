require 'rails_helper'

RSpec.describe Category, type: :model do

let(:category) {create(:category)}

  it {is_expected.to have_many(:products) }
  it {is_expected.to validate_presence_of (:name) }
end
