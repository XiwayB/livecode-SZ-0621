require_relative "view"
require_relative "recipe"
require_relative "parsing"

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_recipes
  end

  def create
    # 1. Ask user for a name (view)
    name = @view.ask_user_for("name")
    # 2. Ask user for a description (view)
    description = @view.ask_user_for("description")
    # 3. Create recipe (model)
    recipe = Recipe.new(name: name, description: description)
    # 4. Store in cookbook (repo)
    @cookbook.add_recipe(recipe)
    # 5. Display
    display_recipes
  end

  def destroy
    # 1. Display recipes
    display_recipes
    # 2. Ask user for index (view)
    index = @view.ask_user_for_index
    # 3. Remove from cookbook (repo)
    @cookbook.remove_recipe(index)
    # 4. Display
    display_recipes
  end

  def import
    ingredient = @view.ask_user_for_ingredient
    get_recipes(ingredient).each_with_index do |recipe, indexx|
      puts "#{indexx + 1} - #{recipe[:title]}: #{recipe[:description]}"
    end
    choice_index = @view.ask_user_for_index
    selected_recipe = get_recipes(ingredient)[choice_index]
    new_recipe = Recipe.new(name: selected_recipe[:title], description: selected_recipe[:description])
    puts new_recipe
    @cookbook.add_recipe(new_recipe)
    display_recipes
  end

  def mark_as_done
    display_recipes
    marked_index = @view.ask_user_for_index
    found_recipe = @cookbook.mark_recipe_as_done(marked_index)
    display_recipes
  end

  private

  def display_recipes
    # 1. Get recipes (repo)
    recipes = @cookbook.all
    # 2. Display recipes in the terminal (view)
    @view.display(recipes)
  end
end
