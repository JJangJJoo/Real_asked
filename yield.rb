def hello
  puts  "hello"
  yield
  puts "welcome"
end


hello do
  puts "john"
  puts "Today cold outside"
end
