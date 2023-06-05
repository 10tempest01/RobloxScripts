repeat wait() until game:IsLoaded()

if game.PlaceId == 5411459567 then

local plr = game:GetService("Players").LocalPlayer
local gold = plr.PlayerGui:WaitForChild("ScreenGui").TextLabel
print(gold.Text)
local message = game:GetService("Workspace"):WaitForChild("Message").Text
local number = message:match("%d+")
local number = tonumber(number)

realgold = gold.Text
gold.Text = realgold .. "\nWaiting.. Please dont hurt me Aphum..."
    
if number < getgenv().MaxTime then
    wait(number + getgenv().PayoutDelay)
end

spawn(function()
    while wait() do
        gold.Text = realgold .. "\nServerhopping. Aphum was here"
        wait(0.5)
        gold.Text = realgold .. "\nServerhopping.. Aphum was here"
        wait(0.5)
        gold.Text = realgold .. "\nServerhopping... Aphum was here"
        wait(0.5)
        gold.Text = realgold .. "\nServerhopping.. Aphum was here"
        wait(0.5)
    end
end)

local randomized = math.random(1, 5)

if randomized == 1 then
    pcall(function() delfile("NotSameServers.json") end)
end

loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DankBladeZS/RobloxScripts/main/GlobalScripts/Serverhop.lua"))()


end
