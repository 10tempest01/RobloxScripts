repeat wait() until game:IsLoaded()

if game.PlaceId == 5411459567 then

local plr = game:GetService("Players").LocalPlayer
local gold = plr.PlayerGui:WaitForChild("ScreenGui").TextLabel
print(gold.Text)
local message = game:GetService("Workspace"):WaitForChild("Message").Text
local number = message:match("%d+")
local number = tonumber(number)

if number < getgenv().MaxTime then
    wait(number + getgenv().PayoutDelay)
end

realgold = gold.Text 
spawn(function()
    while wait() do
        gold.Text = realgold .. "\nServerhopping."
        wait(0.5)
        gold.Text = realgold .. "\nServerhopping.."
        wait(0.5)
        gold.Text = realgold .. "\nServerhopping..."
        wait(0.5)
        gold.Text = realgold .. "\nServerhopping.."
        wait(0.5)
    end
end)

loadstring(game:HttpGetAsync("https://pastebin.com/raw/qc2SwaaA"))()
end
