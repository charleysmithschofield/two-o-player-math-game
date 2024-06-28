# player.rb - Player Class

class Player
  # Create getter methods for @name and @lives 
  # (allows us to read these instances from outside the class)
  attr_reader :name, :lives

  # Initializes a new Player object with a name and lives (3 by default)
  def initialize(name, lives = 3)
    @name = name
    @lives = lives
  end

  # Method to decrease the player's lives by 1
  def lose_life
    @lives -= 1
  end

  # Checks if the player is still alive 
  def alive?
    @lives > 0
  end

  # Returns a string representation of the player's current state,
  # showing the player's name and number of lives remaining.
  def to_s
    "#{name}: #{lives}/3 lives"
  end
end
