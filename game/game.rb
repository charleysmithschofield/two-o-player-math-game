# game.rb - Game Class

require_relative 'player'
require_relative 'question'

class Game
  # Initializes the game with two players and sets the current player to player1
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @current_player = player1
  end

  # Generates a new Question object
  def generate_question
    Question.new
  end

  # Checks the player's answer against the correct answer
  # If the answer is correct, it prints a success message
  # If the answer is incorrect, it prints a failure message and decreases the player's lives
  def check_answer(player, answer, correct_answer)
    if answer == correct_answer
      puts "#{player.name}: YES! You are correct"
    else
      puts "#{player.name}: Seriously? No!"
      player.lose_life
    end
  end

  # Switches turns between player1 and player2
  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  # Checks if the game is over (if either player has no lives left)
  #
  # @return [Boolean] true if the game is over, false otherwise
  def game_over?
    !@player1.alive? || !@player2.alive?
  end

  # Announces the winner and the final scores of both players
  def announce_winner
    winner = @player1.alive? ? @player1 : @player2
    loser = (winner == @player1) ? @player2 : @player1
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "#{loser.name}'s final score: #{loser.lives}/3"
    puts "---- GAME OVER ----\nGood Bye!"
  end

  # Contains the game loop where each instance of the loop is the other player's turn
  def play
    until game_over?
      puts "---- NEW TURN ----"
      question = generate_question
      puts "#{@current_player.name}: #{question.get_question}"
      answer = gets.chomp.to_i
      check_answer(@current_player, answer, question.correct_answer)
      puts "P1: #{@player1} vs P2: #{@player2}\n"
      switch_turns
    end
    announce_winner
  end
end