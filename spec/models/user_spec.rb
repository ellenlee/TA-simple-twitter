RSpec.describe User, type: :model do
  describe 'Association' do
    it { should have_many(:replies) }
    it { should have_many(:tweets) }
  end
end
