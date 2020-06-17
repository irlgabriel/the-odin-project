#spec/calculator_spec.rb

require './lib/calculator.rb'

describe Calculator do
  describe "#add" do
    it "returns the sum of two numbers" do
      calculator = Calculator.new
      expect(calculator.add(5,2)).to eql(7)
    end
    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 5, 7)).to eql(14)
    end
  end

  describe "#multiply" do
    it "returns the product of two numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(5,8)).to eql(40)
    end
    it "returns the product of multiple numbers" do
      calculator = Calculator.new
      expect(calculator.multiply(1,4,5,6)).to eql(120)
    end
  end

  describe "divide" do
    it "divides two numbers" do
      calculator = Calculator.new
      expect(calculator.divide(6,2)).to eql(3)
    end
    it "divides multiple numbers" do
      calculator = Calculator.new
      expect(calculator.divide(15,2,2)).to eql(3)
    end
    it "returns error when dividing by 0" do
      calculator = Calculator.new
      expect(calculator.divide(15,2,0)).to eql("ERROR!")
    end
  end

  describe "subtract" do
    it "subtracts two numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(5,12)).to eql(-7)
    end
    it "subtracts more than two numbers" do
      calculator = Calculator.new
      expect(calculator.subtract(5,12,5,10)).to eql(-22)
    end
  end
end