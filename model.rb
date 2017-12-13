#DataMapper를 통해 데이터를 관리하겠다 "sqlite3: 우리현재폴더주소"
DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/asked.db")

class Question
  include DataMapper::Resource #DataMapper 객체로 Question 클래스 만들겠다
  property :id, Serial #property :원하는네이밍, 데이터형태
  property :name, String
  property :content, Text
  property :created_at, DateTime
end

class Member
  include DataMapper::Resource
  property :id, Serial
  property :email, String
  property :password, String
  property :is_admin, Boolean, :default =>false
  property :created_at, DateTime
end
#위 Question에 말한대로 표를만들겠다 종결선언
DataMapper.finalize

Question.auto_upgrade!
Member.auto_upgrade!
