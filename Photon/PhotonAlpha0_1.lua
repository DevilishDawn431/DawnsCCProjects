--configuration
local my_window = window.create(term.current(), 1, 1, 20, 9)
shell.run("clear")
my_window.clear()
local xpos = term.getCursorPos(x)
local ypos = term.getCursorPos(y)
letters = {"a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
"1","2","3","4","5","6","7","8","9","0","+","-","_","/",".",",","?","!","@"
}
last = ""

--functions
function commandBox()
    my_window.setTextColour(colors.red)
    write("> CMD >")
    my_window.setTextColour(colors.white)
    readtxt = read()
    if fs.exists("/conf/photon/conf.photon") then
        --todo: load conf.photon and any plugins etc
        printError("SUPPORT FOR CONF.PHOTON NOT IMPLEMENTED")
        printError("FIX ME! INSIDE FUNC COMMANDBOX")
    else
        --here you can hard code plugins, i would recommend not doing it tho.
        if readtxt == "example" then
            return "fg ls"
        end
    end
end

--main loop
while true do
    local dir = shell.dir()
    readtxt = ""
    my_window.setTextColour(colors.orange)
    write(shell.dir())
    my_window.setTextColour(colors.white)
    e,k = os.pullEvent("key")
    if k == keys.up then
        readtxt = last
    elseif k == keys.c then
        readtxt = commandBox()
    else
        my_window.setTextColour(colors.orange)
        write("> ")
        my_window.setTextColour(colors.white)
        readtxt = read()
    end
    last = readtxt
    shell.run(readtxt)
    sleep(0.1)
end
