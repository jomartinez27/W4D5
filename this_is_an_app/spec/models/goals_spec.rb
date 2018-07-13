require 'rails_helper'


RSpec.describe Goal, type: :model do
  describe 'Validations' do
    it { should validate_presence_of(:user_id) }
    it { should validate_inclusion_of(:completed).in_array([true, false])}
  end
  
  it { should belong_to(:user) }
end