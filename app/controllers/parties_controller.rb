class PartiesController < ApplicationController
  before_action :authenticate_user!

  def new
    consonne = ["b", "c", "d", "f", "g", "j", "k", "l", "m", "n", "p", "r", "s", "t", "v", "z"]
    voyelle = ["a","e","i","o","u"]
    five_voyelles = (0...5).map { voyelle[(rand * (voyelle.size - 1)).round] }
    five_consonnes = (0...5).map { consonne[(rand * (consonne.size - 1)).round] }
    @ten_letters_list = five_voyelles + five_consonnes
    @solution = params[:solution]
  end

  def score
    @solution = params[:solution]
    @ten_letters_list = params[:letters].chars
    @score_total = 0
    show_response
    @scores = []
    @scores << @score_total
    @best_score = @scores.max
    @number_of_parties = @scores.count
  end

  private

  def show_response
    if valide?(@solution, @ten_letters_list)
      @response = "Bravo! #{@solution} est un mot valide"
      @score_total += @solution.length
    else
      @response = "Désolée, mais #{@solution} ne peut pas être construit avec '#{@ten_letters_list.join(", ")}'"
      @score_total += 0
    end
  end

  def valide?(word, letters)
    word.chars.all? { |letter| word.count(letter) <= letters.count(letter) }
  end
end
