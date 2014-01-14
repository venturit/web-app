# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :custom_field do
    value "test_custom_field"
    label "Test Custom Field"
    options "option1 option2"
    project_id 1
  end
end
