FactoryGirl.define do
  sequence :name do |n|
    "Project 0#{n}"
  end
  
  factory :project do
    name
    description "Awesome project"
    disclaimer  "Only awsome people could join"
    location    "325 East Grand River, East Lansing, MI 48884 USA"
    start_date  Time.now
    end_date    10.days.from_now
    is_open     true
  end
  
end
