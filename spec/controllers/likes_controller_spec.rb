require 'rails_helper'

RSpec.describe LikesController, type: :controller do

    login_user

    before(:each) do
        @user_attr = FactoryBot.build(:user).attributes
        @post_attr = FactoryBot.build(:post).attributes
        @post = Post.create! @post_attr
        @post.save!
        @comment_attr = FactoryBot.build(:comment).attributes
        @comment = Comment.create! @comment_attr
        @comment.save!
    end

    let(:valid_attributes_post) {
        { 
            :post_id => @post.id
        }   
    }

    let(:valid_attributes_comment) {
        {
            :comment_id => @comment.id
        }
    }

    let(:valid_session) { {} }

    describe 'POST #create' do
        it "POSTs a new like to a post" do
            expect {
                post :create, params: {post_id: @post.id, like: valid_attributes_post}, session: valid_session
              }.to change(Like, :count).by(1)
        end 

        it "POSTs a new like to a comment" do
            expect {
                post :create, params: {comment_id: @comment.id, like: valid_attributes_comment}, session: valid_session
            }.to change(Like, :count).by(1)
        end 
    end
end
