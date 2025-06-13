library(ellmer)

recipe <- "
  In a large bowl, cream together 1 cup of softened unsalted butter and ½ cup
  of white sugar until smooth. Beat in 1 egg and 1 teaspoon of vanilla extract.
  Gradually stir in 2 cups of all-purpose flour until the dough forms. Finally,
  fold in 1 cup of semisweet chocolate chips. Drop spoonfuls of dough onto an
  ungreased baking sheet and bake at 350°F (175°C) for 10-12 minutes, or until
  the edges are lightly browned. Let the cookies cool on the baking sheet for
  a few minutes before transferring to a wire rack to cool completely. Enjoy!
"

# Just instructions -----------------------------------------------------------
# I find this most useful for brainstorming

chat <- chat_anthropic("
  The user input contains a recipe. Extract a list of ingredients and
  return it in JSON format."
)
chat$chat(recipe)
chat$chat("Break down the ingredients into finer detail")
chat$chat("EVEN FINER")
chat$chat("EVEN FINER!!!")

# Detailed description --------------------------------------------------------

chat <- chat_anthropic("
  The user input contains a recipe. Extract a list of ingredients and return
  it in JSON format. It should be an array of objects, where each object has
  keys `item`, `quantity`, and `unit`. Put each object on one line of
  output.
")
chat$chat(recipe)

# Example output ---------------------------------------------------------------

chat <- chat_anthropic(r'(
  The user input contains a recipe. Extract a list of ingredients and return
  it in JSON format.

  Example Output:

  ```json
  [
      { "item": "Flour", "quantity": 1, "unit": "cup" },
      { "item": "Vegetable oil", "quantity": 0.5, "unit": "tsp" },
      { "item": "Onion", "quantity": 1, "unit": null },
  ]
  ```)'
)
chat$chat(recipe)

# Use $extract_data() ---------------------------------------------------------

type_ingredients <- type_array(items = type_object(
  ingredient = type_string(),
  quantity = type_number(),
  unit = type_string(required = FALSE)
))

chat <- chat_anthropic("
  The user input contains a recipe. Extract a list of ingredients
")
chat$extract_data(recipe, type = type_ingredients)
