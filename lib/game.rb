class Game
  TOTAL_ERRORS_ALLOWED = 7
  IDENTICALS = {
      "Й" => "И",
      "Ё" => "Е",
    }

  def initialize(word)
    @letters = word.chars
    @user_guesses = []
    @normalized_letters = []
    @normalized_letters = normalized_letters
  end

  def errors
    @user_guesses - @normalized_letters
  end

  def errors_made
    errors.length
  end

  def errors_allowed
    TOTAL_ERRORS_ALLOWED - errors_made
  end

  def letters_to_guess
    @letters.map do |letter|
      if @user_guesses.include?(normalize_letter(letter))
        letter
      else
        nil
      end
    end
  end

  def lost?
    errors_allowed == 0
  end

  def over?
    won? || lost?
  end

  def play!(letter)
    if letter == "Й" || letter == "Ё"
      letter = normalize_letter(letter)
    end
    if !over? && !@user_guesses.include?(letter)
      @user_guesses << letter
    end
  end

  def won?
    (@normalized_letters - @user_guesses).empty?
  end

  def word
    @letters.join
  end

  def normalize_letter(letter)
    IDENTICALS[letter] || letter
  end

  def normalized_letters
    @letters.map{ |letter| normalize_letter(letter) }
  end
end
