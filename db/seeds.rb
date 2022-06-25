
introductions = [
  '脱サラして民宿を始めました。よろしくお願いします。',
  '換気を徹底しています。ぜひ遊びに来てください！',
  '地方loveです。都会での競争もSNSも疲れました',
  '何にもないところで生まれ育ちました。都会に住みたい！！！！！！！！！！！！！']

User.create!(
    name: "yohei", 
    email: "aaaaa@abc.com",
    introduction: "私が第一号です。よろしくお願いします。",
    password:              "123123",
    password_confirmation: "123123",
    )
    
30.times do
  sample_name = Gimei.kanji
  sample_email = Faker::Internet.email
# time = Faker::Date.forward(50)
# time = Faker::Date.between(from: '2021-01-01', to: '2021-04-30')
  User.create!(
    name: sample_name, 
    email: sample_email, 
    introduction: introductions[rand(0..3)],
    password:              "foobar",
    password_confirmation: "foobar",
  )
end

users = User.all.shuffle.take(25)
room_introductions = [
  'とってもいいところです。',
  'すばらしい思い出になることを保証します。',
  '一か八かデートにどうぞ。',
  '日本でも選りすぐりの避暑地です',
  '近隣住民が美女だらけです',
  '大きいベッドと100のアメニティがあります']

3.times do
  users.each do|user| 
    gimei = Gimei.new
    user.rooms.create!(
      name: "ルーム#{user.id}-#{user.rooms.count+1}",
      location: "#{gimei.prefecture.kanji} #{gimei.city.kanji}" ,
      price: rand(1..9)*[100,1000,10000,100000][rand(0..3)],
      introduction: room_introductions[rand(0..5)]
      )
  end
end