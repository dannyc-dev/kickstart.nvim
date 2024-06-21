local dap = require 'dap'
local dap_python = require 'dap-python'

dap_python.setup 'python'
dap_python.test_runner = 'pytest'

table.insert(dap.configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Pytest Current File',
  module = 'pytest',
  args = { '${file}', '-sv' },
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
  name = 'Divvy: Mock Job',
  type = 'python',
  request = 'launch',
  program = '${workspaceFolder}/Divvy/src/python/divvycloud.py',
  args = { 'mock-job', 'ContainerImageScanner', 'digest=sha256:d20b215bf2dbe28e3ea3760bab4af57b968150c6678699f0dffffe1118a48cdc', 'organizations=[1]' },
})

table.insert(dap.configurations.python, {
  type = 'python',
  request = 'launch',
  name = 'Divvy: Mock Harvester',
  program = '${workspaceFolder}/Divvy/src/python/divvycloud.py',
  args = { 'mock-harvester', '--harvester', 'InstanceInterfaceHarvester' }, -- 'location', 'us-east-1'
})
