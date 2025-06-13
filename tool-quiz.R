library(ellmer)

play_sound <- function(sound = c("correct", "incorrect", "you-win")) {
  sound <- match.arg(sound)
  if (sound == "correct") {
    beepr::beep("coin")
  } else if (sound == "incorrect") {
    beepr::beep("wilhelm")
  } else if (sound == "you-win") {
    beepr::beep("fanfare")
  }
  NULL
}

prompt <- "
You're hosting a quiz game show.

* Before you start, ask the user to choose a theme.
* Ask simple questions and ask the user to answer them via multiple choice.
* Format your responses with markdown.
* After the user answers, provide feedback and then move on to the next question.
* After every 5 questions, declare the user to be a winner regardless of their 
  score, lavish them with praise, and start the game over.
* Using the `play_sound()` tool, play sound effects for each answer, and 
  when the user 'wins'.
"

client <- chat_anthropic(
  model = "claude-sonnet-4-20250514",
  system_prompt = prompt
)

client$register_tool(tool(
  play_sound,
  "Plays a sound effect.",
  sound = type_enum(
    "Which sound effect to play.",
    c("correct", "incorrect", "you-win")
  )
))

client$chat("Begin", echo = TRUE) # Jump-start the conversation
live_browser(client, quiet = TRUE) # Continue the conversation
