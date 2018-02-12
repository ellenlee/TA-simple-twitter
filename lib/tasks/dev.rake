namespace :dev do

  # 請先執行 rails dev:fake_user，可以產生 20 個資料完整的 User 紀錄
  # 其他測試用的假資料請依需要自行撰寫
  task fake_user: :environment do
    User.destroy_all
    20.times do |i|
      name = FFaker::Name::first_name
      file = File.open("#{Rails.root}/public/avatar/user#{i+1}.jpg")
      # 這組路徑在 Heroku 上無法使用，同學可跳過 Heroku 上圖片顯示的問題
      # 若特別想攻克的同學可參考 Filestack 說明 => https://lighthouse.alphacamp.co/units/1110

      user = User.new(
        name: name,
        email: "#{name}@example.co",
        password: "12345678",
        introduction: FFaker::Lorem::sentence(30),
        avatar: file
      )

      user.save!
      puts user.name
    end
  end

  task fake_tweet: :environment do
    100.times do |i|
      Tweet.create!(
        description: FFaker::Tweet.body,
        user: User.all.sample
      )
    end
    puts "now you have #{Tweet.count} tweets"
  end

  task liked_tweet: :environment do
    100.times do |i|
      tweet = Tweet.all.sample
      user = User.all.sample
      user.liked_tweets << tweet
    end
    puts "finish liked_tweet"
  end

  task follow: :environment do
    Followship.destroy_all
    User.all.each do |user|
      times = rand(1..10)
      users = User.all.sample(times)
      users = users - [user]

      user.followings << users
      puts "#{user.name} <> #{users.pluck(:name)}"
    end
  end

end
