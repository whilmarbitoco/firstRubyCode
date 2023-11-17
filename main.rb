users = [
  {
    id: 1,
    username: "wb2c0", 
    password: "letmein"
  }
]

def login(uname, upass, users)
  for user in users
    if user[:username] == uname && user[:password] == upass
      return true

    else 
      return false
    end
  end
end


def signup(uname, upass, users)
  add = {
    id: users.length + 1,
    username: uname,
    password: upass
  }
  users.push(add)
end

def main(users)
  puts "Welcome to the Store"
  puts "[1] login"
  puts "[2] Signup"

  print "Input: "
  choice = gets.chomp

  if choice == "1"
    print "Username: "
    username = gets.chomp
    print "Password: "
    password = gets.chomp
    auth = login(username, password, users)
    if auth
      puts "login successful"
    else
      puts "login failed"
    end

  elsif choice == "2"
    print "Username: "
    username = gets.chomp
    print "Password: "
    password = gets.chomp
    signup(username, password, users)
    puts "user #{username} created"
    puts users

  else 
    puts "invalid choices"
  end
end

main(users)
  
