FactoryGirl.define do
  sequence(:email) { |n| "bg#{n}@pipedpiper.net" }
  factory :user do
    first_name 'Rubeus'
    last_name 'Hagrid'
    email
    team
    password 'FleshEatingSlugRepellant'
    password_confirmation 'FleshEatingSlugRepellant'
  end
end
