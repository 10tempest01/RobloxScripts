counter = 0
counterall = 0
counternogamepass = 0
chartable = {"**ABA CHARACTER LIST OF USER: " .. game.Players.LocalPlayer.Name .. "**"}

local dt = DateTime.now()

gamepasschars = {
    "Whitebeard",
    "Shanks",
    "Broly",
    "Goku Black",
    "Minato [4th Hokage]",
    "Edo Madara",
    "Kisuke",
    "Yamamoto",
    "Dio Brando",
    "Doppio/Diavolo"
}

print("-----------------------------------------------------------")

for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui.HUD.CharacterSelect.Characters:GetDescendants()) do
    if v:IsA("ImageButton") and v.ImageColor3 == Color3.fromRGB(51, 51, 51) and v.Parent.Name ~= "Prestige" and not table.find(gamepasschars, v.Name) then
        print("🔴 " .. v.Name)
        table.insert(chartable, ":red_circle: " .. v.Name)
        counterall = counterall + 1
        counternogamepass = counternogamepass + 1
        
    elseif v:IsA("ImageButton") and v.ImageColor3 == Color3.fromRGB(255, 255, 255) and not table.find(gamepasschars, v.Name) then
        print("🟢 " .. v.Name)
        table.insert(chartable, ":green_circle: " .. v.Name)
        counter = counter + 1
        counterall = counterall + 1
        counternogamepass = counternogamepass + 1
        
    elseif v:IsA("ImageButton") and table.find(gamepasschars, v.Name) and v.Parent.Name ~= "Prestige" then
        print("🟡" .. v.Name .. " [Gamepass]")
        table.insert(chartable, ":yellow_circle: " .. v.Name .. " [Gamepass]")
        counterall = counterall + 1
    end
end

print("-----------------------------------------------------------")
print("FINAL: " .. counter .. "/" .. counterall .. " CHARACTERS (not including prestige)" .. counterall-counter .. " characters left")
print("FINAL: " .. counternogamepass .. "/" .. counterall .. " CHARACTERS (not including prestige and gamepass)" .. counterall-counternogamepass .. " characters left")
print("Last Updated: " .. dt:FormatLocalTime("LL", "en-us") .. " at " .. dt:FormatLocalTime("hh", "en-us") .. ":" .. dt:FormatLocalTime("mm", "en-us") .. " " .. dt:FormatLocalTime("A", "en-us"))

table.insert(chartable, "\n**FINAL: " .. counter .. "/" .. counterall .. " CHARACTERS (not including prestige)** " .. counterall-counter .. " characters left")
table.insert(chartable, "**FINAL: " .. counternogamepass .. "/" .. counterall .. " CHARACTERS (not including prestige and gamepass)** " .. counterall-counternogamepass .. " characters left")
table.insert(chartable, "\n**Last Updated: " .. dt:FormatLocalTime("LL", "en-us") .. " at " .. dt:FormatLocalTime("hh", "en-us") .. ":" .. dt:FormatLocalTime("mm", "en-us") .. " " .. dt:FormatLocalTime("A", "en-us") .. "**")

setclipboard(table.concat(chartable, "\n"))
