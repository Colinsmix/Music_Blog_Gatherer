require 'spec_helper'

describe CommentsController do
  let!(:user){ FactoryGirl.build(:user) }
  let!(:blog1){ FactoryGirl.create(:blog, tag_list: ['Jazz', 'Rock'], status: 'Verified') }
  describe 'GET #index' do
    it 'populates an array of comments' do
      comment = FactoryGirl.create(:comment)
      get :index
      assigns(:comments).should eq([comment])
    end
  end


end
