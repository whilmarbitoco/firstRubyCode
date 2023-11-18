
def login(uname, upass, users)
  for user in users
    if user[:username] == uname && user[:password] == upass
      return user[:id]

    else 
      return false
    end
  end
end


def signup(uname, upass, users)
  add = {
    id: users.length + 1,
    username: uname,
    password: upass,
    balance: 0
  }
  users.push(add)
end
