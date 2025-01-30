local plr = game:GetService("Players").LocalPlayer
local uis = game:GetService("UserInputService")
local stgui = game:GetService("StarterGui")

local frontDashArgs = {
	[1] = {
		["Dash"] = Enum.KeyCode.W,
		["Key"] = Enum.KeyCode.Q,
		["Goal"] = "KeyPress"
	}
}

local function frontDash()
	plr.Character.Communicate:FireServer(unpack(frontDashArgs))
end

local function noEndlagSetup(char)
	uis.InputBegan:Connect(function(input, gameproc)
		if gameproc then return end
		
		if input.KeyCode == Enum.KeyCode.Q and not uis:IsKeyDown(Enum.KeyCode.D) and not uis:IsKeyDown(Enum.KeyCode.A) and not uis:IsKeyDown(Enum.KeyCode.S) and char:FindFirstChild("UsedDash") then
			frontDash()
		end
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

local function emoteDashSetup(char)
	local hrp = char:WaitForChild("HumanoidRootPart")
	uis.InputBegan:Connect(function(input, gameproc)
		if gameproc then return end
		
		if input.KeyCode == Enum.KeyCode.Q and not uis:IsKeyDown(Enum.KeyCode.W) then
			local vel = hrp:FindFirstChild("dodgevelocity")
			if vel then
				vel:Destroy()
				stopAnimation(char, 10480793962)
			end
		end
	end)
end

if plr.Character then
	noEndlagSetup(plr.Character)
	emoteDashSetup(plr.Character)
end

plr.CharacterAdded:Connect(emoteDashSetup)
plr.CharacterAdded:Connect(noEndlagSetup)

if not getgenv().DisableNotification then
	stgui:SetCore("SendNotification", {
		Title = "[Loaded] Made by Galestrike",  -- Title of the notification
		Icon = "rbxassetid://107722845930572",
		Text = "Thanks for using!", -- Message inside the notification
		Duration = 5, -- Duration in seconds
		Button1 = "Dismiss", -- Optional button text
		Callback = function() end
	})
end
