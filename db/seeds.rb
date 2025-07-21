# Καθαρισμός collections
CardCost.delete_all
User.delete_all

# Clearing Costs
CardCost.create(id: 4001, country_code: 'US', cost: 5)
CardCost.create(id: 4002, country_code: 'GR', cost: 15)
CardCost.create(id: 4004, country_code: 'DK', cost: 12)
CardCost.create(id: 4005, country_code: 'IT', cost: 7)
CardCost.create(id: 4006, country_code: 'AE', cost: 9)
CardCost.create(id: 4007, country_code: 'IR', cost: 6)
CardCost.create(id: 4003, country_code: 'OTHERS', cost: 10)

# Users
User.create(role: 'ADMIN', username: 'admin1', password: 'adminPass')
User.create(role: 'USER', username: 'user1', password: 'userPass1')
User.create(role: 'USER', username: 'user2', password: 'userPass2')
