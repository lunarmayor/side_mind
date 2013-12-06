# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :list_assignment, :class => 'ListAssignments' do
    user_id 1
    list_id 1
  end
end
