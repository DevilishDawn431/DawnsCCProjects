-- this is alpha release 0.1
-- Photon terminal, the latest and greatest terminal of CC: Tweaked
local my_window = window.create(term.current(), 1, 1, 20, 9)
shell.run("clear")
my_window.clear()

local xpos = term.getCursorPos(x)
local ypos = term.getCursorPos(y)
local file = fs.open("/.conf/photon/.conf.photon", "r")
local lines = {}
while true do
  -- terminal
  local dir = shell.dir()
  my_window.setTextColour(colors.orange)
  write(dir .. "> ")
  my_window.setTextColour(colors.white)
  local readtxt = read()
  shell.run(readtxt)
  local BBar = string.char(16)
  sleep(0.01)
  

  -- filelist
  while readtxt == "fl" do
    shell.run("clear")
    local readtxt = "clear"
    print("Search:")
    local files = fs.list("/*/" .. read())
    for i = 1, #files do
      print(files[i])
    end
    local event, character = os.pullEvent("char")
    if character == "!" then shell.run("clear") print("File:") shell.run("edit") read() break end
    if character == "*" then shell.run("clear") break end
  end
  --while readtxt == "?" do
    --shell.run("clear")
    --print("Index: ")
    --shell.run(".appdata/photon/help+")
  --break end

  -- plugins
  --local file = fs.open("/.conf/photon/Plugin.photon", "r")
  --local contents = file.readAll()
  --file.close()
  --shell.run("clear")
end
-- todo: add error handling, auto reboot, terminal tiling, plugins, config, better ui, compatibility mode (runs selected terminal for usage), keybinder and help menu
