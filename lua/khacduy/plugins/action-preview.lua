local status, actions_preview = pcall(require, "actions-preview")
local status_hl, actions_preview_hightlight = pcall(require, "actions-preview.highlight")
if not status then
	return
end

if not status_hl then
	return
end

actions_preview.setup({
  highlight_command = {
    -- Highlight diff using delta: https://github.com/dandavison/delta
    -- The argument is optional, in which case "delta" is assumed to be
    -- specified.
    actions_preview_hightlight.delta("path/to/delta --option1 --option2"),
    -- You may need to specify "--no-gitconfig" since it is dependent on
    -- the gitconfig of the project by default.
    -- hl.delta("delta --no-gitconfig --side-by-side"),

    -- Highlight diff using diff-so-fancy: https://github.com/so-fancy/diff-so-fancy
    -- The arguments are optional, in which case ("diff-so-fancy", "less -R")
    -- is assumed to be specified. The existence of less is optional.
    actions_preview_hightlight.diff_so_fancy("path/to/diff-so-fancy --option1 --option2"),

    -- Highlight diff using diff-highlight included in git-contrib.
    -- The arguments are optional; the first argument is assumed to be
    -- "diff-highlight" and the second argument is assumed to be 
    -- `{ colordiff = "colordiff", pager = "less -R" }`. The existence of
    -- colordiff and less is optional.
    actions_preview_hightlight.diff_highlight(
      "path/to/diff-highlight",
      { colordiff = "path/to/colordiff" }
    ),

    -- And, you can use any command to highlight diff.
    -- Define the pipeline by `hl.commands`.
    actions_preview_hightlight.commands({
      { cmd = "command-to-diff-highlight" },
      -- `optional` can be used to define that the command is optional.
      { cmd = "less -R", optional = true },
    }),
    -- If you use optional `less -R` (or similar command), you can also use `hl.with_pager`.
    actions_preview_hightlight.with_pager("command-to-diff-highlight"),
    -- hl.with_pager("command-to-diff-highlight", "custom-pager"),
  },
 telescope = {
    sorting_strategy = "ascending",
    layout_strategy = "vertical",
    layout_config = {
      width = 0.8,
      height = 0.9,
      prompt_position = "top",
      preview_cutoff = 20,
      preview_height = function(_, _, max_lines)
        return max_lines - 15
      end,
    },
  },

})
