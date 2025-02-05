game:GetService("StarterGui"):SetCore("SendNotification", {
		Title = "[WARNING] Discontinued",
		Icon = "rbxassetid://134296412574194",
		Text = "This script has been discontinued. Join discord.gg/ewjaP4Q8dw for new version + more info. The invite should be copied to your clipboard if your executor supports it.",
		Duration = 5,
		Button1 = "Dismiss",
		Callback = function()
		end
})
setclipboard("https://discord.gg/ewjaP4Q8dw")
--[[
local plr = (game:GetService("Players")).LocalPlayer
local uis = game:GetService("UserInputService")
local stgui = game:GetService("StarterGui")
getgenv().Toggle = true

if getgenv().AlreadyRan1537896 then
	stgui:SetCore("SendNotification", {
		Title = "[WARNING] Running",
		Icon = "rbxassetid://134296412574194",
		Text = "The script is already running!",
		Duration = 5,
		Button1 = "Dismiss",
		Callback = function()
		end
	})
	return
end

getgenv().AlreadyRan1537896 = true

if not getgenv().ToggleKeyBind then
	stgui:SetCore("SendNotification", {
		Title = "[WARNING] Old Version",
		Icon = "rbxassetid://134296412574194",
		Text = "You have the old version of the script, please contact me at @10.tempest.01 on Discord for the new version",
		Duration = 5,
		Button1 = "Dismiss",
		Callback = function()
		end
	})
	return
end

local frontDashArgs = {
	[1] = {
		Dash = Enum.KeyCode.W,
		Key = Enum.KeyCode.Q,
		Goal = "KeyPress"
	}
}

local function frontDash()
	plr.Character.Communicate:FireServer(unpack(frontDashArgs))
end

local function noEndlagSetup(char)
	local connection = uis.InputBegan:Connect(function(input, t)
		if t then
			return
		end
		if (getgenv()).Toggle and input.KeyCode == Enum.KeyCode.Q and (not uis:IsKeyDown(Enum.KeyCode.D)) and (not uis:IsKeyDown(Enum.KeyCode.A)) and (not uis:IsKeyDown(Enum.KeyCode.S)) and char:FindFirstChild("UsedDash") then
			frontDash()
		end
	end)
	char.Destroying:Connect(function()
		connection:Disconnect()
	end)
end

local function stopAnimation(char, animationId)
	local humanoid = char:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		local animator = humanoid:FindFirstChildWhichIsA("Animator")
		if animator then
			for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
				if track.Animation and track.Animation.AnimationId == "rbxassetid://" .. tostring(animationId) then
					track:Stop()
				end
			end
		end
	end
end

local function isAnimationRunning(char, animationId)
	local humanoid = char:FindFirstChildWhichIsA("Humanoid")
	if humanoid then
		local animator = humanoid:FindFirstChildWhichIsA("Animator")
		if animator then
			for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
				if track.Animation and track.Animation.AnimationId == "rbxassetid://" .. tostring(animationId) then
					return true
				else
					return false
				end
			end
		end
	end
end

local function emoteDashSetup(char)
	local hrp = char:WaitForChild("HumanoidRootPart")
	local connection = uis.InputBegan:Connect(function(input, t)
		if t then
			return
		end
		if (getgenv()).Toggle and input.KeyCode == Enum.KeyCode.Q and (not uis:IsKeyDown(Enum.KeyCode.W)) and (not uis:IsKeyDown(Enum.KeyCode.S)) and (not isAnimationRunning(char, 10491993682)) then
			local vel = hrp:FindFirstChild("dodgevelocity")
			if vel then
				vel:Destroy()
				stopAnimation(char, 10480793962)
				stopAnimation(char, 10480796021)
			end
		end
	end)
	char.Destroying:Connect(function()
		connection:Disconnect()
	end)
end

if plr.Character then
	noEndlagSetup(plr.Character)
	emoteDashSetup(plr.Character)
end

plr.CharacterAdded:Connect(emoteDashSetup)
plr.CharacterAdded:Connect(noEndlagSetup)
uis.InputBegan:Connect(function(input, t)
	if t then
		return
	end
	if input.KeyCode == (getgenv()).ToggleKeyBind then
		(getgenv()).Toggle = not (getgenv()).Toggle
		stgui:SetCore("SendNotification", {
			Title = "[Script] Toggled",
			Icon = "rbxassetid://134296412574194",
			Text = "Script has been toggled " .. ((getgenv()).Toggle and "ON" or "OFF"),
			Duration = 5,
			Callback = function()
			end
		})
	end
end)

if not (getgenv()).DisableNotification then
	stgui:SetCore("SendNotification", {
		Title = "[Loaded] Tempest Reset v1.1",
		Icon = "rbxassetid://134296412574194",
		Text = "Thanks for using!",
		Duration = 5,
		Button1 = "Dismiss",
		Callback = function()
		end
	})
end
]]
