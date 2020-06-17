class Calculator
  def add(*args)
    args.reduce {|sum, num| sum + num}
  end
  def multiply(*args)
    args.reduce(1) {|sum, num| sum * num}
  end
  def subtract(*args)
    args.reduce {|dif, num| dif - num}
  end
  def divide(*args)
    return "ERROR!" if args.include?(0)
    res = args[0]
    args = args[1..args.length - 1]
    args.reduce(res) {|res, num| res / num}
  end
end
