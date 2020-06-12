
def fibonacci_rec number
  return 1 if number == 1 || number == 2
  fibonacci_rec(number - 1) + fibonacci_rec(number - 2) if number > 1
end

def fibonacci number
  sequence = [0, 1]
  i = 2
  while i <= number
    sequence.push sequence[i - 1] + sequence[i - 2]
    i += 1
  end
  return sequence[number]
end

#puts fibonacci_rec(5)
#puts fibonacci(5)