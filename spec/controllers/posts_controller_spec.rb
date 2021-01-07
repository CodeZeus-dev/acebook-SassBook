require 'rails_helper'
include ActiveSupport::Testing::TimeHelpers

Devise::Test::ControllerHelpers

RSpec.describe PostsController, type: :controller do

  login_user

  let(:valid_attributes) {
    { 
      :postBody => "Post Body",
      :user_id => 1
    }
  }
  
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      Post.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      post = Post.create! valid_attributes
      get :show, params: {id: post.to_param}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      post = Post.create! valid_attributes
      get :edit, params: {id: post.to_param}, session: valid_session
      expect(response).to be_successful
    end

    it "returns an alert when trying to edit a post after 10 minutes from its creation time" do
      post = Post.create! valid_attributes
      travel 11.minutes
      get :edit, params: {id: post.to_param}, session: valid_session
      expect(flash[:alert]).to be_present
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Post" do
        expect {
          post :create, params: {post: valid_attributes}, session: valid_session
        }.to change(Post, :count).by(1)
      end

      it "redirects to the created post" do
        post :create, params: {post: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Post.last)
      end
    end

    # context "with invalid params" do
    #   it "returns a success response (i.e. to display the 'new' template)" do
    #     post :create, params: {post: invalid_attributes}, session: valid_session
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        { :postBody => "Post Body on a Saturday" }
      }

      it "updates the requested post" do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: new_attributes}, session: valid_session
        post.reload
        expect(post.postBody).to eq("Post Body on a Saturday")
      end

      it "redirects to the post" do
        post = Post.create! valid_attributes
        put :update, params: {id: post.to_param, post: valid_attributes}, session: valid_session
        expect(response).to redirect_to(post)
      end
    end

    # context "with invalid params" do
    #   it "returns a success response (i.e. to display the 'edit' template)" do
    #     post = Post.create! valid_attributes
    #     put :update, params: {id: post.to_param, post: invalid_attributes}, session: valid_session
    #     expect(response).to be_successful
    #   end
    # end
  end

  describe "DELETE #destroy" do
    it "destroys the requested post" do
      post = Post.create! valid_attributes
      expect {
        delete :destroy, params: {id: post.to_param}, session: valid_session
      }.to change(Post, :count).by(-1)
    end

    it "redirects to the posts list" do
      post = Post.create! valid_attributes
      delete :destroy, params: {id: post.to_param}, session: valid_session
      expect(response).to redirect_to(posts_url)
    end
  end

end
