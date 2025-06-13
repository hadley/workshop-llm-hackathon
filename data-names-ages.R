library(ellmer)

prompts <- list(
  "I go by Alex. 42 years on this planet and counting.",
  "Pleased to meet you! I'm Jamal, age 27.",
  "They call me Li Wei. Nineteen years young.",
  "Fatima here. Just celebrated my 35th birthday last week.",
  "The name's Robert - 51 years old and proud of it.",
  "Kwame here - just hit the big 5-0 this year."
)

type_person <- type_object(name = type_string(), age = type_number())
chat <- chat_anthropic()
parallel_chat_structured(chat, prompts, type_person)

# Good practice to also test with negative examples ----------------------------
chat <- chat_anthropic()
prompts <- list(
  "Kwame here - just hit the big 5-0 this year.",
  "I like apples",
  "What time is it?",
  "This cheese is 3 years old",
  "My name is Hadley."
)
parallel_chat_structured(chat, prompts, type_person)

type_person <- type_object(
  name = type_string(required = FALSE),
  age = type_number(required = FALSE)
)
parallel_chat_structured(chat, prompts, type_person)

chat <- chat_anthropic(
  "If the text is not about a person, return null for age and name."
)
parallel_chat_structured(chat, prompts, type_person)
