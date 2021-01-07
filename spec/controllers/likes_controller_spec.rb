require 'rails_helper'

RSpec.describe LikesController, type: :controller do

    login_user

    let(:valid_attributes) {
        { 
            :postBody => "Post Body",
            :user_id => 1
        }   
    }

    before(:each) do
        @post_attributes = FactoryBot.attributes_for(:post, :user_id => @user)
    end

    describe 'POST #create' do
        it "POSTs a new like to a post" do
            post :create, params: { user_id: @user.id, post_id: @post_attributes.id }
            expect { response }.to change(Like, :count).by(1)
        end 
    end
end
