require 'spec_helper'

describe FavoriteBlog do
  
  context 'Associations' do
    it { should belong_to :blog }
    it { should belong_to :user }
  end

end
