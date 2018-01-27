RSpec.describe 'Tweet', type: :request do
  let(:user) { create(:user) }
  describe '#index' do
    it 'will redirect to log in page if not login' do
      get tweets_path
      expect(response).to redirect_to(new_user_session_path)
      expect(response).to have_http_status(302)
    end

    it 'will show all tweets if log in' do
      sign_in(user)
      get tweets_path
      expect(response).to have_http_status(200)
      expect(controller.current_user).to eq(user)
    end
  end

end
