library(ellmer)

chat <- chat_anthropic()

chat$chat(
  content_image_file("holly-mandarich-3p9zaNwUtv8-unsplash.jpg"),
  "Describe this photo"
)
chat$chat("Where in the world do you think it is?")

# Can also extract structured data
chat$chat_structured(
  "",
  type = type_object(
    people = type_number("How many people in the photo?"),
    landscape = type_string("Briefly describe the landscape"),
    location = type_string()
  )
)
