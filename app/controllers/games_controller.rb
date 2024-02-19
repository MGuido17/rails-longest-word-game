require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def generate_letters
    alphabet = ('A'..'Z').to_a.sample
    @letters = []
    10.times do
      @letters << alphabet
    end
    @letters
  end

  def score
    @word = params[:word]
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    @valid_word = JSON.parse(URI.open(url).read)
    @counter = 0
    @letters = params[:letters]
    @array_word = @word.upcase.split('')
    if @letters.present?
      @array_word.each do |letter|
        if @array_word.count(letter) > @letters.count(letter)
          @counter += 1
        end
      end
    end
  end
end
