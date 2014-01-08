require 'spec_helper'

describe Message do
  it { should validate_presence_of :email }
  it { should validate_presence_of :subject }
  it { should validate_presence_of :description }
  it { should validate_presence_of :first_name }
  it { should validate_presence_of :last_name }

  it { should have_valid(:email).when('test@test.com', 'test+spam@example.com', 'hereisanemail@example.me') }
  it { should_not have_valid(:email).when('fail', 123, 'example@here') }   
end
