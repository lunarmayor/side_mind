
FactoryGirl.define do
  factory :user do
    name 'John Test'
    email 'John@example.com'
    password 'randompass'
    password_confirmation 'randompass'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end