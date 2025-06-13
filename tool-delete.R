# DANGER DANGER DANGER

file.create("a.csv")
file.create("b.csv")

chat <- chat_anthropic()
chat$register_tool(tool(
  function() dir(),
  "Lists the files in the current directory",
  .name = "ls"
))

# DANGER DANGER DANGER
chat$register_tool(tool(
  function(path) unlink(path),
  path = type_array(items = type_string()),
  "Delete a file",
  .name = "rm"
))

chat$chat("Delete all the csv files")
chat$chat("Delete readme.md")

# Safer!
delete_file <- function(path) {
  allow_read <- utils::askYesNo(
    "Would you like to delete these files?"
  )
  if (isTRUE(allow_read)) {
    unlink(path)
  } else {
    tool_reject()
  }
}
chat$register_tool(tool(
  delete_file,
  path = type_array(items = type_string()),
  "Delete a file",
  .name = "rm"
))

chat$chat("Delete all the files in the current directory")
