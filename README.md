# LLM hackathon

* [Foundations](slides-3-south-africa-1.pdf)
* [Applications](slides-3-south-africa-2.pdf)

## Setup

You'll need the latest version (0.4.0) of ellmer:

```r
pak::pak("ellmer")
```

You'll also need to set up at least one chat provider. If you don't already have an API account (a paid subscription unfortunately doesn't count), we recommend either Claude, OpenAI, or Gemini. Claude and OpenAI offer very similar performance, but Claude is a little more expensive. Gemini is a little worse, but offers a very generous free tier.

### Claude

1. Sign up at <https://console.anthropic.com>.
1. Load up enough credit to buy a coffee.
1. Create a key at <https://console.anthropic.com/settings/keys> and copy it to the clipboard.
1. `usethis::edit_r_environ()`.
1. Add a new line containing: `ANTHROPIC_API_KEY={paste}`.
1. Restart R.
1. Check that `ellmer::chat_claude()$chat("Tell me a joke")` works.

### OpenAI

1. Sign up at <https://platform.openai.com/login>
1. Go to <https://platform.openai.com/settings/organization/billing/overview> and load up enough credit to buy a coffee.
1. Create a key at <https://platform.openai.com/settings/organization/api-keys> and copy it to the clipboard.
1. `usethis::edit_r_environ()`.
1. Add a new line containing: `OPENAI_API_KEY={paste}`.
1. Restart R.
1. Check that `ellmer::chat_openai()$chat("Tell me a joke")` works.

### Gemini (api key)

1. Log in to <https://aistudio.google.com> with a google account
1. Click *create API key* & copy it to the clipboard.
1. `usethis::edit_r_environ()`
1. Add a new line containing: `GOOGLE_API_KEY={paste}`
1. Restart R.
1. Check that `ellmer::chat_google_gemini()$chat("Tell me a joke")` works.

### Gemini (OAuth)

If the other methods fail, you can try this fallback. 

1. Run `ellmer::chat_google_gemini()$chat("Hi")`.
2. Log in with a google account
3. On the slightly scary screen that says "Google hasn’t verified this app", click "Advanced" then "Go to ellmer (unsafe)".
4. Click "Continue".
