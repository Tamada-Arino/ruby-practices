str = ""

(1..20).each do |n|
  str += "Fizz" if n % 3 == 0
  str += "Buzz" if n % 5 == 0
  str == "" ? (puts n) : (puts str)
  str = ""
end
