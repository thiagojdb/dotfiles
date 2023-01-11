local home = os.getenv "HOME"

local git_module_path = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' })

local workspace_folder = home .. "/.local/share/eclipse/" .. git_module_path

print(workspace_folder)

local java_debug_path = vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/*.jar"
  , 1)

local jdtls_bundles = {
  java_debug_path
};

vim.list_extend(jdtls_bundles,
  vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n"))

local config = {
  cmd = {

    -- 💀
    'java', -- or '/path/to/java17_or_newer/bin/java'
    -- depends on if `java` is in your $PATH env variable and if it points to the right version.

    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
    '-Xms1g',
    '--add-modules=ALL-SYSTEM',
    '--add-opens', 'java.base/java.util=ALL-UNNAMED',
    '--add-opens', 'java.base/java.lang=ALL-UNNAMED',


    -- 💀
    '-jar',
    '/home/thiago/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',

    '-configuration', '/home/thiago/.local/share/nvim/mason/packages/jdtls/config_linux',

    '-data', workspace_folder
  },

  root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),

  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-1.8",
            path = "/usr/lib/jvm/java-8-openjdk-amd64/",
          },
          {
            name = "JavaSE-11",
            path = "/usr/lib/jvm/java-11-openjdk-amd64/",
          },
          {
            name = "JavaSE-17",
            path = "/usr/lib/jvm/java-17-openjdk-amd64/",
          },
        }
      }
    }
  },

  on_attach = function(client, bufnr)
    -- With `hotcodereplace = 'auto' the debug adapter will try to apply code changes
    -- you make during a debug session immediately.
    -- Remove the option if you do not want that.
    -- You can use the `JdtHotcodeReplace` command to trigger it manually
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  end,

  init_options = {
    bundles = jdtls_bundles
  },

}
return config;
