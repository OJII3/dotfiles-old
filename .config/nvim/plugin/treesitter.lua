local status, ts = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

ts.setup {
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'css',
    'dockerfile',
    'go',
    'gomod',
    'graphql',
    'html',
    'java',
    'javascript',
    'json',
    'lua',
    'python',
    'regex',
    'rust',
    'toml',
    'tsx',
    'typescript',
    'yaml',
    'markdown',
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = 1000,
  },
}
