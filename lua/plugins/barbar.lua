local ok, barbar = pcall(require, "bufferline")
if not ok then
  return
end

barbar.setup()
