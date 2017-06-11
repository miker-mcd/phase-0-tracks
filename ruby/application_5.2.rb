application = {
  name: "Michael",
  address: "1234 something way",
  email: "myemail@email.com",
  phone: "123-456-7890",
  fave_blue: "navy",
  wallpaper: "Paisley",
  ombre: "Fierce",
  hired: true
}

# Store key as variable and access hash with variable.
user_name = :name

p application[user_name]

# => 'Michael'

# Access hash with key value.
p application[:name]

# => 'Michael'

# Perform operation with return values from hash.
p application[:name] + application[:address]

# => 'Michael1234 something way'

# Does it affect the original hash version?
p application

# => no change