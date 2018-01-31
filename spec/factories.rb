FactoryBot.define do
  factory :tweet do
    description FFaker::Tweet.body
    user
  end

  factory :user do
    email FFaker::Internet.email
    password '123456'
    name FFaker::Name.html_safe_last_name

    factory :user_with_tweets do
      transient do
        tweets_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:tweet, evaluator.tweets_count, user: user)
      end
    end
  end
end
