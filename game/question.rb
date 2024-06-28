# question.rb - Question Class

class Question
  # Create a getter method for @correct_answer
  # (allows us to read the correct answer from outside the class)
  attr_reader :correct_answer

  # Initializes a new Question object with two random numbers
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @correct_answer = @num1 + @num2
  end

  # Returns the math question as a string
  def get_question
    "What does #{@num1} plus #{@num2} equal?"
  end
end