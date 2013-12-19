require 'spec_helper'

describe Comment do

  context 'Assocations' do 
    it { should belong_to :user }
    it { should belong_to :blog }
  end

  context 'Body' do
    it { should validate_presence_of :body }
  end
  
end
