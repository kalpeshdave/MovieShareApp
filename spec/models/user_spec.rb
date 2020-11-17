require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(email: 'example@domain.com', password: '123123') }

  it 'ensures email presence' do
    subject.email = nil
    expect(subject.save).to eq(false)
  end

  it 'ensures email format' do
    subject.email = 'example'
    expect(subject.save).to eq(false)
  end

  it 'ensures password presence' do
    subject.password = nil
    expect(subject.save).to eq(false)
  end

  it 'ensures password length more than or equal to 6 characters' do
    subject.password = '123'
    expect(subject.save).to eq(false)
  end

  it 'should success with valid email and password' do
    expect(subject.save).to eq(true)
  end
end
