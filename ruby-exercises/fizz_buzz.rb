
def fizz_buzz(n) 
  (1..n).to_a.map{|num| num % 15 == 0 ? 'FizzBuzz' : num % 3 == 0 ? 'Fizz' : num % 5 == 0 ? 'Buzz' : num}
end
number = gets.chomp.to_i
p fizz_buzz(number)
