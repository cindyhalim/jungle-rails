require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do 
    subject {User.create(first_name: 'Atlanta', last_name: "Hawks", email: "atlanta@test.com", password: "testtest", password_confirmation: "testtest")}
    it 'should be created with a password and password_confirmation field' do
      expect(subject).to be_valid
    end

    it 'should not pass when passwords don\'t match' do 
      subject.password_confirmation = 'teststest'
      expect(subject).to_not be_valid
    end
    
    it 'should include email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end
    
    it 'should include a unique email' do
      user1 = User.create(first_name: 'Bob', last_name: "Builder", email: "test@test.COM", password: "testtest", password_confirmation: "testtest")
      expect(user1).to be_valid

      user2= User.create(first_name: 'Bob1', last_name: "Builder", email: "TEST@TEST.COM", password: "testtest", password_confirmation: "testtest")
      expect(user2).to_not be_valid
    end
    
    it 'should include first name' do
      subject.first_name = nil
      expect(subject).to_not be_valid
    end

    it 'should include last name' do
      subject.last_name = nil
      expect(subject).to_not be_valid
    end

    it 'should have a minimum password length' do
      newUser = User.create(first_name: 'Bob', last_name: "Builder", email: "abc@builder.com", password: "test", password_confirmation: "test")
      expect(newUser).to_not be_valid

      otherUser = User.create(first_name: 'Bob', last_name: "Builder", email: "abc1@builder.com", password: "thisisatest", password_confirmation: "thisisatest")
      expect(otherUser).to be_valid
    end
  end

  # describe '.authenticate_with_credentials' do
  #   it 'should authenticate with whitespace' do
  #     user = User.new(first_name: 'Bob', last_name: 'Builder', email: '  abc@builder.com  ', password: 'thisisatest', password_confirmation: 'thisisatest')
  #     expect(User.authenticate_with_credentials('  atlanta@test.com  ', 'testtest')).to_not be_nil
  #   end

  #   it 'should not be case-sensitive with emails' do 
  #     user = User.new(first_name: 'Atlanta', last_name: 'Hawks', email: 'atlaNta@TEST.com', password: 'testtest', password_confirmation: 'testtest')
  #     expect(User.authenticate_with_credentials(user.email, user.password)).to_not be_nil
  #   end
  # end

end
