CANT_BUILD = "Sorry but #{@answer} can't be built out of #{@letters}"
NOT_VALID_WORD = "Sorry but #{@answer} is not a valid English word"
CONGRATS = "Congratulations #{@ answer} is a valid English word"
class GamesController < ApplicationController

  def new
    @letters = [*('A'..'Z')].sample(10).join
  end
  def score
    @grid = params[:grid]
    @answer = params[:word]
    grid_letters = @grid.each_char { |letter| print letter, ''}
    if !letter_in_grid
      @result = CANT_BUILD
    elsif letter_in_grid && !english_word
      @result = NOT_VALID_WORD
    elsif letter_in_grid && english_word
      @result = CONGRATS
    end
  end

  private
  def letter_in_grid
    @answer.chars.sort.all? { |letter| @grid.include?(letter) }
  end
  def english_word
  end
end
