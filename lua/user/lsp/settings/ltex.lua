local function get_git_root()
    local dot_git_path = vim.fn.finddir(".git", ".;")
    return vim.fn.fnamemodify(dot_git_path, ":p:h:h")
end

local function hidden()
        -- For dictionary, search for files in the runtime to have
        -- and include them as externals the format for them is
        -- dict/{LANG}.txt
        --
        -- Also add dict/default.txt to all of them
        local files = {
          ["en-US"] = { ":" .. get_git_root() .. "/langtool/hidden/en-US" }
        }
        for _, file in ipairs(vim.api.nvim_get_runtime_file("hidden/*", true)) do
          local lang = vim.fn.fnamemodify(file, ":t:r")
          local fullpath = vim.fs.normalize(file, ":p")
          files[lang] = { ":" .. fullpath }
        end

        if files.default then
          for lang, _ in pairs(files) do
            if lang ~= "default" then
              vim.list_extend(files[lang], files.default)
            end
          end
          files.default = nil
        end

        return files
end

local function dictionaries()
        -- For dictionary, search for files in the runtime to have
        -- and include them as externals the format for them is
        -- dict/{LANG}.txt
        --
        -- Also add dict/default.txt to all of them
        local files = {
          ["en-US"] = { ":" .. get_git_root() .. "/langtool/dicts/en-US" }
        }
        for _, file in ipairs(vim.api.nvim_get_runtime_file("dict/*", true)) do
          local lang = vim.fn.fnamemodify(file, ":t:r")
          local fullpath = vim.fs.normalize(file, ":p")
          files[lang] = { ":" .. fullpath }
        end

        if files.default then
          for lang, _ in pairs(files) do
            if lang ~= "default" then
              vim.list_extend(files[lang], files.default)
            end
          end
          files.default = nil
        end

        return files
end

local function disabledRules()
        -- For dictionary, search for files in the runtime to have
        -- and include them as externals the format for them is
        -- dict/{LANG}.txt
        --
        -- Also add dict/default.txt to all of them
        local files = {
          ["en-US"] = { ":" .. get_git_root() .. "/langtool/rules/disabled/en-US" }
        }
        for _, file in ipairs(vim.api.nvim_get_runtime_file("rules/disabled/*", true)) do
          local lang = vim.fn.fnamemodify(file, ":t:r")
          local fullpath = vim.fs.normalize(file, ":p")
          files[lang] = { ":" .. fullpath }
        end

        if files.default then
          for lang, _ in pairs(files) do
            if lang ~= "default" then
              vim.list_extend(files[lang], files.default)
            end
          end
          files.default = nil
        end

        return files
end

local function enabledRules()
        -- For dictionary, search for files in the runtime to have
        -- and include them as externals the format for them is
        -- dict/{LANG}.txt
        --
        -- Also add dict/default.txt to all of them
        local files = {
          ["en-US"] = { ":" .. get_git_root() .. "/langtool/rules/enabled/en-US" }
        }
        for _, file in ipairs(vim.api.nvim_get_runtime_file("rules/enabled/*", true)) do
          local lang = vim.fn.fnamemodify(file, ":t:r")
          local fullpath = vim.fs.normalize(file, ":p")
          files[lang] = { ":" .. fullpath }
        end

        if files.default then
          for lang, _ in pairs(files) do
            if lang ~= "default" then
              vim.list_extend(files[lang], files.default)
            end
          end
          files.default = nil
        end

        return files
end

local opts = {
  settings = {
    ltex = {
      enabled = { "bibtex", "latex", "tex", "html", "markdown", "org", "rsweave", "restructuredtext" },
      language = "en-US",
      dictionary = dictionaries(),
      disabledRules = disabledRules(),
      enabledRules = enabledRules(),
      hiddenFalsePositives = hidden(),
      additionalRules = {
        languageModel = "~/Documents/BookBinding/en"
      },
      latex = {
        commands = {
          ["\\hypertarget{}"] = "ignore",
          ["\\label{}"] = "ignore",
          ["\\texorpdfstring{}"] = "ignore",
        }
      },
      trace = {
        server = "on"
      }
    },
  },
}

return opts
