# DANGER DANGER DANGER

file.create("a.csv")
file.create("b.csv")

chat <- chat_anthropic()
chat$register_tool(tool(
  function() dir(),
  "Lists the files in the current directory",
  .name = "ls"
))

# DANGER ====================================================================
# DANGER DANGER DANGER
# DANGER DANGER DANGER
# DANGER DANGER DANGER
chat$register_tool(tool(
  function(path) unlink(path),
  path = type_string(),
  "Delete a file",
  .name = "rm"
))
# ============================================================================

chat$chat("What files are in the current directory?")
chat$chat("Delete all the csv files")
