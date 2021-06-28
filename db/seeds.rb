
introductions = ['よろしくお願いします。','ぜひ！遊びに来てください！','地方loveです','都会に住みたい！！！！']

User.create!(
    name: "yohei_admin", 
    email: "aaaaa@abc.com", 
    introduction: "私が神です",
    password:              "foobar",
    password_confirmation: "foobar",
    )
    
30.times do
  sample_name = Gimei.kanji
  sample_email = Faker::Internet.email
# time = Faker::Date.forward(50)
# time = Faker::Date.between(from: '2021-01-01', to: '2021-04-30')
  User.create!(
    name: sample_name, 
    email: sample_email, 
    introduction: introductions[rand(0..2)],
    password:              "foobar",
    password_confirmation: "foobar",
  )
end

users = User.all.shuffle.take(30)
room_introductions = ['いいところです。', 'すごい思い出になります。','デートにどうぞ。']

2.times do
  users.each do|user| 
    gimei = Gimei.new
    user.rooms.create!(
      name: "ルーム#{user.id}-#{user.rooms.count+1}",
      location: "#{gimei.prefecture.kanji} #{gimei.city.kanji}" ,
      price: rand(1..9)*[10,100,1000][rand(0..2)],
      introduction: room_introductions[rand(0..2)]
      )
  end
end