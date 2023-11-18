require_relative "auth.rb"

users = [{ id: 1, username: "wb2c0", password: "letmein", balance: 100000 }]
products = [
  { id: 1, product: "iPhone", price: 80000 },
  { id: 2, product: "iPad", price: 60000 },
  { id: 3, product: "MacBook", price: 100000 }
]

def buy(id, pid, users, products)
  userbal = nil

  users.each do |user|
    if user[:id] == id
      userbal = user[:balance]
      products.each do |product|
        if product[:id] == pid
          if userbal > product[:price]
            user[:balance] -= product[:price]
            puts users
            return true
          else
            return false
          end
        end
      end
      break
    end
  end

  return false if userbal.nil?
  false
end

def store(id, users, products)
  puts "Welcome, #{users[id - 1][:username]}!"
  puts "What would you like to do?"
  puts "[1] Buy"
  puts "[2] Sell"
  puts "[3] Exit"
  print "[Choices]>: "
  choice = gets.chomp.to_i

  if choice == 1
    print "Enter product ID to buy: "
    product_id = gets.chomp.to_i
    success = buy(id, product_id, users, products)
    if success
      puts "Purchase successful!"
    else
      puts "Purchase failed. Insufficient balance or invalid product ID."
    end
  end
end

def main(users, products)
  puts "Welcome to the Store"
  puts "[1] Login"
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
      puts "Login successful"
      store(auth, users, products)
    else
      puts "Login failed"
    end

  elsif choice == "2"
    print "Username: "
    username = gets.chomp
    print "Password: "
    password = gets.chomp
    signup(username, password, users)
    puts "User #{username} created"
  else
    puts "Invalid choice"
  end
end

main(users, products)
