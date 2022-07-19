local ok, indent_o_matic = pcall(require, "indent-o-matic")
if not ok then
  return
end

indent_o_matic.setup {
  -- The values indicated here are the defaults
  max_lines = 2048,               -- Number of lines without indentation before giving up (use -1 for infinite)
  standard_widths = { 2, 4, 8 },  -- Space indentations that should be detected
  skip_multiline = true           -- Skip multi-line comments and strings (more accurate detection but less performant)
}

