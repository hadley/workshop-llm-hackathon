library(ellmer)

chat <- chat_google_gemini(
  "You're a terse assistant",
  model = "gemini-2.0-flash"
)
chat$register_tool(tool(
  function() Sys.Date(),
  "Gets the current date",
  .name = "today"
))
chat$chat("When was Cher born?")

# We could switch to a different model, or a different provider
# OR we could solve the problem WITH MOAH AI
find_birthday <- function(name) {
  chat <- chat_openai(model = "gpt-4.1-nano")
  prompt <- interpolate("When was {{name}} born? ")
  chat$chat(prompt, echo = FALSE)
}
find_birthday("Cher")

chat$register_tool(tool(
  find_birthday,
  "get the birthday of famous people",
  name = type_string()
))
chat$chat("How old is Cher today?")
