# LLM hackathon

[Slides](slides-1-monash.pdf)

## Setup

You'll need the dev version of ellmer:

```r
#| eval: false
pak::pak("tidyverse/ellmer")
```

You'll also need to set up at least one chat provider. If you don't already have an API account (a paid subscription unfortunately doesn't count), we recommend either Claude or Gemini. Claude is cheap and good at R code, while gemini is free and good at videos. Follow the instructions below to configure one.

### Claude

1. Sign up at <https://console.anthropic.com>.
1. Load up enough credit to buy a coffee.
1. Create a key at <https://console.anthropic.com/settings/keys> and copy it to the clipboard.
1. `usethis::edit_r_environ()`.
1. Add a new line containing: `ANTHROPIC_API_KEY={paste}`.
1. Restart R.
1. Check that `ellmer::chat_claude()$chat("Tell me a joke")` works.

### Gemini

1. Log in to <https://aistudio.google.com> with a google account
1. Click *create API key* & copy it to the clipboard.
1. `usethis::edit_r_environ()`
1. Add a new line containing: `GOOGLE_API_KEY={paste}`
1. Restart R.
1. Check that `ellmer::chat_gemini()$chat("Tell me a joke")` works.
