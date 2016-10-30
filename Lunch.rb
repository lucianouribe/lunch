require 'pry'
# MENU ARRAYS
@main = [
  {item: '| ITEM |', price: 'PRICE', description: '| DESCRIPTION |', calories: 'CALORIES |'},
  {item: 'Hamburger', price: 12.50, description: 'Cheese Burger', calories: 2000},
  {item: 'Pizza', price: 8.99, description: 'Napolitana', calories: 1200},
  {item: 'Tacos', price: 4.55, description: 'with Chipotle sauce', calories: 1500}
]
@drinks = [
  {item: 'Soda', price: 2.00, description: 'Pepsi, Coke, Schweps', calories: 800},
  {item: 'Beer', price: 3.00, description: 'Budweiser', calories: 600},
  {item: 'Water', price: 2.50, description: 'Perrier', calories: 150}
]
@deserts = [
  {item: 'Tiramisu', price: 5.00, description: '100 gr slice', calories: 900},
  {item: 'Creme Brulee', price: 6.00, description: 'Small pot', calories: 1000},
  {item: 'Ice Cream', price: 3.50, description: 'Two balls', calories: 1200}
]

# TEMPORARY ORDER ARRAY
@order = []

# PUTS MENU
def options
  puts "--- GREAT DELICIOUS AND NUTRICIOUS GANDMAS MENU --- \n\n"
  @main.each { |x, i| puts "#{x[:item]} $#{x[:price]} #{x[:description]} #{x[:calories]}"}
  @drinks.each { |x, i| puts "#{x[:item]} $#{x[:price]} #{x[:description]} #{x[:calories]}"}
  @deserts.each { |x, i| puts "#{x[:item]} $#{x[:price]} #{x[:description]} #{x[:calories]}"}
end


# ORDER FOOD METHOD
def order_food
  puts "So, what's your order?"
  choice = gets.strip.downcase
  if choice.include?('ham')
    @ordered_food = 'Hamburger'
    @order << @main[1]
    add_drink('Hamburger')
  elsif choice.include?('piz')
    @ordered_food = 'Pizza'
    @order << @main[2]
    add_drink('Pizza')
  elsif choice.include?('taco')
    @ordered_food = 'Tacos'
    @order << @main[3]
    add_drink('Tacos')
  end
end

# DRINK CHOICE METHOD
def add_drink(food)
  puts "#{food}! Great its super tasty"
  puts "What do you want to drink?"
  choice = gets.strip.downcase
  if choice.include?('soda')
    @ordered_drink = 'Soda'
    @order << @drinks[0]
    weather('Soda')
  elsif choice.include?('beer')
    @ordered_drink = 'Beer'
    @order << @drinks[1]
    weather('Beer')
  elsif choice.include?('water')
    @ordered_drink = 'Just water'
    @order << @drinks[2]
    weather('Water')
  end
end

# THE WEATHER DETAIL METHOD
def weather(liquid)
  weather = ['hot', 'warm', 'unbearable', 'sunny']
  puts "A #{liquid} will be! Yeah, its too #{weather[rand(4)]} in here"
  puts "And for desert?"
  add_desert()
end

# DESERT CHOICE
def add_desert
  choice = gets.strip
  if choice.include?('tira')
    @ordered_desert = 'Tiramisu'
    @order << @deserts[0]
    confirmation
  elsif choice.include?('crem')
    @ordered_desert = 'Creme Brulee'
    @order << @deserts[1]
    confirmation
  elsif choice.include?('ice cr')
    @ordered_desert = 'Ice Cream'
    @order << @deserts[2]
    confirmation
  end
end

# CONFIRM MENU
def confirmation
  puts "So, your order is #{@ordered_food}, #{@ordered_drink} for dinking and #{@ordered_desert}"
  puts "Is it true that you want something else?"
  choice = gets.strip
  if choice.include?('y')
    resending
  else
    sleep 1
    bill
  end
end

# SECOND CHOICE
def resending
  puts "What would it be?"
  @last_choice = gets.strip
  if @last_choice.include?('ham')
    @order << @main[1]
  elsif @last_choice.include?('piz')
    @order << @main[2]
  elsif @last_choice.include?('tac')
    @order << @main[3]
  elsif @last_choice.include?('soda')
    @order << @drinks[0]
  elsif @last_choice.include?('beer')
    @order << @drinks[1]
  elsif @last_choice.include?('water')
    @order << @drinks[2]
  elsif @last_choice.include?('tira')
    @order << @deserts[0]
  elsif @last_choice.include?('crem')
    @order << @deserts[1]
  elsif @last_choice.include?('ice cre')
    @order << @deserts[2]
  end
  more_stuff
end

# RECAP
def more_stuff
  puts "So, your order is #{@ordered_food}, #{@ordered_drink} for dinking, #{@ordered_desert} and #{@last_choice}"; sleep 1
  bill
end

# BILL
def bill
  puts "Time has passed by..."; sleep 1
  puts "Sorry my shift is over I have to charge you right now"
  puts 'Here is the bill'; sleep 1
  @order.each { |x, i| puts "#{x[:item]} #{x[:price]}"; sleep 1 }
  print "Total: "
  sum = 0
  sub_total = @order.map { |p| sum+=p[:price]}
  puts sub_total.last
  @total = sub_total.last
  paying_methods
end

# PAYING METHODS
def paying_methods
  puts "Are you paying with cash or credit card"
  money_type = gets.strip
  if money_type.include?('credit') || money_type.include?('yes')
    puts "Thats all right!"; sleep 1
    puts "Have a nice day! Don't forget to tip!!!"
    the_peoples_safety_obligation
  else
    puts "With which bill are you going to pay me?"
    the_moment_of_truth = gets.strip.to_i
    if the_moment_of_truth < @total
      puts "Ok my friend, you will wash a lot of plates and maybe get some violence from the cheff!"; sleep 2
      puts "He's not in a good humour today!"
      exit
    else
      print "There you go, this is yours: "
      puts the_moment_of_truth.round(2) - @total.round(2); sleep 1
      the_peoples_safety_obligation
    end
  end
end

# CALORIES CALCULATION METHOD
def caloric_bomb
  sum = 0
  sub_total = @order.map { |p| sum+=p[:calories]}
  print @caloric_bomb = sub_total.last
end

# SUPER ANNIYING GOODBYE
def the_peoples_safety_obligation
  puts "Sorry"; sleep 1
  puts "just the last question. Did you came here by car?"
  locomotion = gets.strip
  if locomotion.include?('y')
    puts "I'm sorry but you'll have to give me the keys"
    puts "You cannot drive, you have eaten..."
    caloric_bomb
    puts " calories!!!!"; sleep 1
    puts "Walk and burn those calories"; sleep 1
    puts "Stop looking me like that and keep walking!"; sleep 2
    puts "I'm seeing you! You're not doing it fast enough"; sleep 3
    puts "Get lost!!!!"
    exit
  else
    puts "Never mind, have a nice day!"
    exit
  end
end

# START INTRO
def start
  puts "Hello welcome to my restaurant, do you want to see the menu?"
  answer = gets.strip
  if answer.include?('y')
    options
    order_food
  else
    puts 'So what are you doing here? Go away!'
  end
end

# THE WHILE
while true
  start
end
