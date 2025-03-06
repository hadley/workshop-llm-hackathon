library(ellmer)

iris_glimpse <- paste0(capture.output(dplyr::glimpse(iris)), collapse = "\n")
diamonds_glimpse <- paste0(capture.output(dplyr::glimpse(ggplot2::diamonds)), collapse = "\n")

prompt <- interpolate_file("ggplot2-prompt.md", glimpse = diamonds_glimpse)

chat <- chat_claude()
chat$chat(prompt)
