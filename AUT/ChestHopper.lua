if getgenv().Disable3DRendering then
	game:GetService("RunService"):Set3dRenderingEnabled(false)
end

repeat task.wait() until game:IsLoaded()

local plr = game:GetService("Players").LocalPlayer

for _, chestSpawn in pairs(game:GetService("Workspace").ItemSpawns.Chests:GetChildren()) do
	if chestSpawn:FindFirstChild("Chest") then
		
		--Chest checks
		local chest = chestSpawn:FindFirstChild("Chest")
		local highlight = Instance.new("Highlight", chest)
		
		repeat wait() until chest.RootPart:FindFirstChild("ProximityAttachment") and chest.RootPart:FindFirstChild("ProximityAttachment"):FindFirstChild("Interaction") or not chest
		local proxAttachment = chest.RootPart:FindFirstChild("ProximityAttachment")
		local proxPrompt = chest.RootPart:FindFirstChild("ProximityAttachment"):FindFirstChild("Interaction")
		--
		
		--Character check
		local char = plr.Character or plr.CharacterAdded:Wait()
		
		--TP and fire ProximityPrompt
		if char and char:FindFirstChild("HumanoidRootPart") then
			local hrp = char:FindFirstChild("HumanoidRootPart")
			repeat task.wait(0.2)
				if chest:FindFirstChild("RootPart") then
					hrp.CFrame = chest.RootPart.CFrame + Vector3.new(0, 2, 0)
				end
				fireproximityprompt(proxPrompt)
			until (not proxAttachment) or (not proxPrompt) or (not proxAttachment and not proxPrompt) or not chest:FindFirstChild("RootPart")
		end
		--
	end
end

local function store()
	
	if plr.Character then
		for _, tool in pairs(plr.Backpack:GetChildren()) do
			if getgenv().ItemsToStore[tool.Name] == true then
				tool.Parent = plr.Character
			end
		end
	end
	
	task.wait(0.5)
	
	game:GetService("ReplicatedStorage"):WaitForChild("ReplicatedModules"):WaitForChild("KnitPackage"):WaitForChild("Knit"):WaitForChild("Services"):WaitForChild("InventoryService"):WaitForChild("RE"):WaitForChild("ItemInventory"):FireServer({["AddItems"] = true})
end

if getgenv().AutoStore then
	store()
end

task.wait(4)

if getgenv().Serverhop then
	loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/DankBladeZS/RobloxScripts/main/GlobalScripts/Serverhop.lua"))()
end
