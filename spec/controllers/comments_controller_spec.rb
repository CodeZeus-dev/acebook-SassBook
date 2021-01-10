require 'rails_helper'

RSpec.describe CommentsController, type: :controller do

  login_user

  before(:each) do 
    @user_attr = FactoryBot.build(:user).attributes
    @post_attr = FactoryBot.build(:post).attributes
    @post = Post.create! @post_attr
    @post.save!
  end

  let(:valid_attributes) {
    { 
      :comment => "Life is great",
      :post_id => @post_attr["id"]
    }
  }
  
  let(:valid_session) { {} }
  
  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do
    it "POSTs a new comment for a given post" do
      expect {
        post :create, params: {comment: valid_attributes}, session: valid_session
      }.to change(Comment, :count).by(1)
    end
  end

end
