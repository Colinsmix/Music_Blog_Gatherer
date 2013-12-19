require 'spec_helper'

describe Vote do

  context 'Associations' do
    it { should belong_to :blog }
    it { should belong_to :user }
  end

  context 'Amount' do
    it { should validate_presence_of :amount }
  end

end
