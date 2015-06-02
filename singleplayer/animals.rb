def animals(previous_animal = "", chosen_animals = [], wrong = 0)
  all_animals = ['aap', 'paard']
  last_letter = previous_animal.split("").last
  system 'cls'
  puts "Type an animal name:" if previous_animal.empty?
  puts "#{previous_animal.capitalize} was given, please enter an animalname which ends with the letter '#{last_letter}'" unless previous_animal.empty?
  while wrong < 3
    animal = gets.chomp.downcase
    if (animal.split("")[0] == last_letter || previous_animal.empty?) && all_animals.include?(animal) && chosen_animals.include?(animal) == false
      chosen_animals << animal
      break
    elsif animal.empty? && previous_animal.empty?
      wrong += 1
      puts "Your answer is empty, please enter an animalname:" if wrong < 3
    elsif animal.empty?
      wrong += 1
      puts "Your answer is empty, please enter an animalname which ends with the letter '#{last_letter}'" if wrong < 3
    elsif (animal.split("")[0] == last_letter) == false && previous_animal.empty? == false
      wrong += 1
      puts "#{animal.capitalize} doesn't start with #{last_letter}, please try again:" if wrong < 3
    else
      wrong += 1
      puts "#{animal.capitalize} doesn't exists, please try again:" if wrong < 3
    end
  end
  if wrong < 3
    puts 'here'
    animals(animal, chosen_animals)
  else
    puts "You've lost!"
  end
end

animals
