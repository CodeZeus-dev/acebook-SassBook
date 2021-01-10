FactoryBot.define do
  factory :user do
    id {1}
    email {"test@user.com"}
    password {"qwerty"}
    name {"Wendy"}
    # Add additional fields as required via your User model
  end

  factory :post do
    id {"5e102573-a99c-4ffa-a151-11877a75ed1b"}
    postBody {"Hello Wendy!"}
    user_id {1}
  end

  factory :comment do
    id {1}
    content {"Hi I'm Symion and my names mean horsemonkey <3"}
    post_id {"5e102573-a99c-4ffa-a151-11877a75ed1b"}
    user_id {1}
  end
  
end