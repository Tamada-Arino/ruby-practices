(1..20).each do |n|
  print_text = ""
  print_text += "Fizz" if n % 3 == 0
  print_text += "Buzz" if n % 5 == 0
  print_text = n if print_text == ""
  puts print_text
end
