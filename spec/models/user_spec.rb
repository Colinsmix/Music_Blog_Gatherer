require 'spec_helper'

describe User do

  context 'Associations' do
    it { should have_many(:blogs) }
    it { should have_many(:favorites) }
    it { should have_many(:comments) }
    it { should have_many(:votes) }
  end
  
  context 'Username' do
    it { should validate_presence_of :username }
  end

  context 'Password' do
    it { should validate_presence_of :password }
  end

  context 'Email' do
    it { should validate_presence_of :email }
    it { should have_valid(:email).when('test@test.com', 'test+spam@example.com', 'hereisanemail@example.me') }
    it { should_not have_valid(:email).when('fail', 123, 'example@here') }   
  end

  context 'Uniqueness' do
    before(:each) do
      FactoryGirl.create(:user)
    end

    it { should validate_uniqueness_of :email}
    it { should validate_uniqueness_of :username}    
  end
end
