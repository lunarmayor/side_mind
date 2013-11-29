
FactoryGirl.define do
  factory :user do
    name 'John Test'
    phone '9783871813'
    email 'John@example.com'
    password 'randompass'
    password_confirmation 'randompass'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end