require "./Player"
require "./Question"

def line_break 
  puts ""
end

#initialize new players
print "Player 1, please enter your name: "
name1 = gets.chomp
line_break
print "Player 2, please enter your name: "
name2 = gets.chomp
line_break
puts "You each have 3 lives to start, if you answer incorrectly you will lose a life!"

player1 = Player.new(name1)
player2 = Player.new(name2)

game_won = false
winner = ""

asking_player = player1
answering_player = player2

until game_won do 

  #assign random numbers for question
  x = rand(1..20)
  y = rand(1..20)
  
  #ask a question, capture answer from player on cli
  question = Question.new(x, y)
  question_to_ask = "What does #{x} plus #{y} equal? " 
  line_break
  print "#{asking_player.name} asks #{answering_player.name} : #{question_to_ask}"
  answer = gets.chomp.to_i
  line_break
  #check if answer is correct
  if (question.check_answer?(answer))
    puts "#{asking_player.name} : Yes, that is correct!"
    line_break
  else #if answer is wrong, remove life from answering player
    answering_player.lose_life
    puts "#{asking_player.name} : Absolutely not, wrong answer!"
    line_break
  end

  #display score
  player1_score = player1.check_score
  player2_score = player2.check_score
  puts "#{player1.name}'s current score: #{player1_score} vs #{player2.name}'s current score: #{player2_score}"
  line_break
  #check if the game is over

  if player1.lost?
    winner = player2
  elsif player2.lost?
    winner = player1
  else 
    winner = ""
  end

  if winner == ""
    puts "---- NEXT TURN ----"
    22
    asking_player = asking_player == player1 ? player2 : player1 
    answering_player = answering_player == player2 ? player1 : player2
  else 
    game_won = true
    line_break
    puts "#{winner.name} wins with a score of #{winner.check_score}"
    line_break
    puts "---- GAME OVER ----"
    puts "Good bye!"
  end


end