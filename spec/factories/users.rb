
FactoryGirl.define do
  
  factory :user do |u|
    u.sequence(:name) {|n| "foo 0#{n}" }
    u.sequence(:email) {|n| "mail#{n}@photosynq.com"}
    u.password "foobar123"
    u.password_confirmation "foobar123"
    u.bio "Awesome researcher"
  end 
  
  factory :confirmed_user, :parent => :user do
     after(:create) { |user| user.confirm! }
   end
  
  
  factory :admin, :parent => :confirmed_user do
    is_admin true
  end
  
end