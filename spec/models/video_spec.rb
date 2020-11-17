require 'rails_helper'

RSpec.describe Video, type: :model do
  subject { Video.new(user_id: user.id, url: "https://www.youtube.com/watch?v=8feLvQ4rshk") }
  let(:user) { User.create!(email: 'example@domain.com', password: '123123', password_confirmation: '123123') }
  
  it 'ensures user presence' do
    subject.user_id = nil
    expect(subject.save).to eq(false)
  end

  it 'ensures youtube url presence' do
    subject.url = nil
    expect(subject.save).to eq(false)
  end

  it 'ensures url should only from youtube' do
    subject.url = 'https://vimeo.com/49079667'
    expect(subject.save).to eq(false)
  end

  it 'should be success with valid youtube url and user' do
    expect(subject.save).to eq(true)
  end
end
