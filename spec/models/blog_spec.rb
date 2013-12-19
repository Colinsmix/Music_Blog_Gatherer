require 'spec_helper'

describe Blog do

  context 'Associations' do
    it { should belong_to :user }
    it { should have_many :comments }
    it { should have_many :favorites }
    it { should have_many :votes }
  end

  context 'Name' do
    it { should validate_presence_of :name }
  end

  context 'Url' do
    it { should validate_presence_of :url }
  end

  context 'Uniqueness' do
    before(:each) do
      FactoryGirl.create(:blog)
    end
    it { should validate_uniqueness_of :url }
  end

end
