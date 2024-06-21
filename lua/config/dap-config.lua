local dap = require 'dap'
local dap_python = require 'dap-python'

dap_python.setup 'python'
dap_python.test_runner = 'pytest'

dap.configurations.python = {}
table.insert(dap.configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Launch Current File',
  program = '${file}',
})

table.insert(dap.configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Pytest Current File',
  module = 'pytest',
  args = { '${file}', '-sv' },
})

table.insert(dap.configurations.python, {
  name = 'Divvy: Mock Job',
  type = 'python',
  request = 'launch',
  program = '${workspaceFolder}/Divvy/src/python/divvycloud.py',
  args = function()
    local user_input = vim.fn.input 'Mock Job: <Job name> <Job params>: '
    local args = vim.split(user_input, ' ')
    table.insert(args, 1, 'mock-job')
    return args
  end,
})

table.insert(dap.configurations.python, {
  name = 'Divvy: Webserver',
  type = 'python',
  request = 'launch',
  program = '${workspaceFolder}/Divvy/src/python/divvycloud.py',
  args = { '--log-level', 'debug', '--skip-scheduler-check', 'webserver', '--cors-mode' },
})

table.insert(dap.configurations.python, {
  name = 'Divvy: Worker',
  type = 'python',
  request = 'launch',
  program = '${workspaceFolder}/Divvy/src/python/divvycloud.py',
  args = { '--skip-scheduler-check', 'worker' }, -- 'enabled-jobs', 'ContainerImageScanner'
})

table.insert(dap.configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Divvy: Mock Harvester',
  program = '${workspaceFolder}/Divvy/src/python/divvycloud.py',
  args = function()
    local user_input = vim.fn.input 'Mock Harvester: <Harvester name> <Harvester params>: '
    local args = vim.split(user_input, ' ')
    table.insert(args, 1, '--harvester')
    table.insert(args, 1, 'mock-harvester')
    return args
  end,
})
