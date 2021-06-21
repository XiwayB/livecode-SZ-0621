class View
  def display(recipes)
    recipes.each_with_index do |recipe, index|
      status = recipe.done? ? "✅" : "[ ]"
      puts "#{index + 1} - #{status} #{recipe.name}: #{recipe.description}"
    end
  end

  def ask_user_for(stuff)
    puts "#{stuff.capitalize}?"
    print "> "
    return gets.chomp
  end

  def ask_user_for_index
    puts "Index?"
    print "> "
    return gets.chomp.to_i - 1
  end

  def ask_user_for_ingredient
    puts "What ingredient would you like to search?"
    print "> "
    return gets.chomp
  end
end
