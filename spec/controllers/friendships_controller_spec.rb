require 'rails_helper'

RSpec.describe FriendshipsController, type: :controller do

  before(:each) do
    @user = FactoryBot.create(:user)
  end

  # describe "GET #accept_friend" do
  #   it "renders the accept_friend page" do
  #     get :accept_friend, params: { user_id: @user.id }
  #     expect(response).to be_successful
  #   end
  # end

  # describe "POST #create" do
  #   it "creates a new friendship" do
  #     expect {
  #         post :create, params: {friendship: valid_attributes}, session: valid_session
  #       }.to change(Friendship, :count).by(1)
  #   end
  # end

end
