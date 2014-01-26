require 'spec_helper'

describe BlogsController do
  let!(:user){ FactoryGirl.build(:user) }
  describe 'GET #index' do
    it 'populates an array of verified blogs' do
      blog = FactoryGirl.create(:blog)
      get :index
      assigns(:blogs).should eq([blog])
    end

    it 'doesnt populate an array of unverified blogs' do
      blog = FactoryGirl.create(:blog, status: 'unverified')
      get :index
      assigns(:blogs).should_not eq([blog])
    end

    it 'gives you the top 5 favorited blogs' do
      blog1 = FactoryGirl.create(:blog)
      blog2 = FactoryGirl.create(:blog)
      blog3 = FactoryGirl.create(:blog)
      blog4 = FactoryGirl.create(:blog)
      blog5 = FactoryGirl.create(:blog)
      get :index
      assigns(:favorite5).should eq([blog1,blog2,blog3,blog4,blog5])
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new Blog in the database' do
        user.save!
        sign_in_as(user)
        expect{
          post :create, blog: FactoryGirl.attributes_for(:blog)
        }.to change(Blog,:count).by(1)
      end
    end

    context 'without valid attributes' do
      it 'does not save a new contact in the database' do
        user.save!
        sign_in_as(user)
        expect{
          post :create
        }.to change(Blog,:count).by(0)
      end
    end
  end
end

