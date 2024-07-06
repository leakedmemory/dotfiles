local function find_matching_chars(quote_chars)
  local curpos = vim.api.nvim_win_get_cursor(0)
  local line = vim.api.nvim_get_current_line()
  local from, to

  -- check for quotes before the cursor
  for _, char in ipairs(quote_chars) do
    local start, _ = line:find(char, 1, true)
    local s, e
    while start and start < curpos[2] do
      s, e = line:find(char .. "([^" .. char .. "]*)" .. char, start)
      if s and e and curpos[2] >= s and curpos[2] <= e then
        from = { line = curpos[1], col = s + 1 }
        to = { line = curpos[1], col = e - 1 }
        return { from = from, to = to }
      end
      start, _ = line:find(char, start + 1, true)
    end
  end

  -- check for quotes after the cursor
  for _, char in ipairs(quote_chars) do
    local start = curpos[2]
    local s, e
    repeat
      s, e = line:find(char .. "([^" .. char .. "]*)" .. char, start)
      if s and e then
        from = { line = curpos[1], col = s + 1 }
        to = { line = curpos[1], col = e - 1 }
        return { from = from, to = to }
      end
      start = e and e + 1 or start
    until not s or not e
  end
end

local function find_block(start_pattern, end_pattern, include_delim)
  local curpos = vim.api.nvim_win_get_cursor(0)
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  local from, to

  -- find start of block
  for i = curpos[1], 1, -1 do
    if lines[i]:match(start_pattern) then
      from = i
      break
    end
  end

  -- find end of block
  for i = curpos[1], #lines do
    if lines[i]:match(end_pattern) then
      to = i
      break
    end
  end

  -- adjust boundaries based on include_lines flag
  if from and to and from ~= to then
    if include_delim then
      return { from = { line = from, col = 1 }, to = { line = to, col = #lines[to] } }
    else
      return { from = { line = from + 1, col = 1 }, to = { line = to - 1, col = #lines[to - 1] } }
    end
  end
end

return {
  "echasnovski/mini.ai",
  version = false,
  opts = {
    custom_textobjects = {
      -- select inside quotes
      q = function()
        local quote_chars = { '"', "'", "`" }
        return find_matching_chars(quote_chars)
      end,

      -- select the entire file
      g = function()
        local from = { line = 1, col = 1 }
        local to = { line = vim.fn.line("$"), col = vim.fn.col({ vim.fn.line("$"), "$" }) }
        return { from = from, to = to }
      end,

      -- select inside code block excluding block's delimeter
      o = function()
        local start_pattern = "^```%a+"
        local end_pattern = "^```$"
        return find_block(start_pattern, end_pattern, false)
      end,

      -- select inside code block including block's delimeter
      O = function()
        local start_pattern = "^```%a+"
        local end_pattern = "^```$"
        return find_block(start_pattern, end_pattern, true)
      end,
    },
  },
  config = function(_, opts)
    require("mini.ai").setup(opts)
  end,
}
