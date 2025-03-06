library(ellmer)

chat <- chat_gemini()
chat$chat("How old is Cher? Explain your working")

chat$register_tool(tool(
  function() Sys.Date(),
  "Gets the current date",
  .name = "today"
))
chat$chat("How old is she today? Explain your working")
