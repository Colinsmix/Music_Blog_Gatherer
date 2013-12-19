require 'spec_helper'

describe Favorite do
  
  context 'Associations' do
    it { should belong_to :blog }
    it { should belong_to :user }
  end

end
