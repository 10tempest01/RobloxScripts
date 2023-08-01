local camera = workspace.CurrentCamera
local entitiesFolder = workspace.Entities
local npcsFolder = (game:GetService("Workspace")).NPCs
local plr = (game:GetService("Players")).LocalPlayer
local runService = game:GetService("RunService")
local userInputService = game:GetService("UserInputService")
local espEnabled = false

local function esp(entity, color)
	local humanoid = entity:FindFirstChild("Humanoid")
	local humanoidRootPart = entity:FindFirstChild("HumanoidRootPart")
	if not humanoid or (not humanoidRootPart) then
		return
	end
	local textLabel = Drawing.new("Text")
	textLabel.Visible = false
	textLabel.Center = true
	textLabel.Outline = true
	textLabel.Font = 4
	textLabel.Color = color
	textLabel.Size = 18
	local ancestryChangedConnection
	local healthChangedConnection
	local renderSteppedConnection
	local function disconnectConnections()
		textLabel.Visible = false
		textLabel:Remove()
		if ancestryChangedConnection then
			ancestryChangedConnection:Disconnect()
			ancestryChangedConnection = nil
		end
		if healthChangedConnection then
			healthChangedConnection:Disconnect()
			healthChangedConnection = nil
		end
		if renderSteppedConnection then
			renderSteppedConnection:Disconnect()
			renderSteppedConnection = nil
		end
	end
	ancestryChangedConnection = entity.AncestryChanged:Connect(function(_, parent)
		if not parent then
			disconnectConnections()
		end
	end)
	healthChangedConnection = humanoid.HealthChanged:Connect(function(health)
		if health <= 0 then
			disconnectConnections()
		end
	end)
	renderSteppedConnection = runService.RenderStepped:Connect(function()
		local hrpPosition, hrpOnScreen = camera:WorldToViewportPoint(humanoidRootPart.Position)
		local entityRace = entity:GetAttribute("EntityType") or "Unknown"
		if hrpOnScreen then
			textLabel.Position = Vector2.new(hrpPosition.X, hrpPosition.Y)
			if not entity:FindFirstChild("Health") then
				textLabel.Text = "[" .. (string.split(entity.Name, "_"))[1] .. "]\n(" .. math.round(entity.Humanoid.Health) .. "/" .. entity.Humanoid.MaxHealth .. ")\n(" .. entityRace .. ")"
			else
				textLabel.Text = "[" .. entity.Name .. "]" .. "\n(" .. math.floor(entity.Humanoid.Health + 0) .. "/" .. entity.Humanoid.MaxHealth .. ")\n(" .. entityRace .. ")"
			end
			textLabel.Visible = espEnabled
		else
			textLabel.Visible = false
		end
	end)
end
local function instanceEsp(instance, color, text)
	local textLabel = Drawing.new("Text")
	textLabel.Visible = false
	textLabel.Center = true
	textLabel.Outline = true
	textLabel.Font = 4
	textLabel.Color = color
	textLabel.Size = 18
	renderSteppedConnection = runService.RenderStepped:Connect(function()
		local instancePosition, instanceonScreen = camera:WorldToViewportPoint(instance.Position)
		local instanceDistance = math.round(plr:DistanceFromCharacter(instance.Position) or 0)
		if instanceonScreen then
			textLabel.Position = Vector2.new(instancePosition.X, instancePosition.Y)
			textLabel.Text = text .. "\n(" .. instanceDistance .. "m)"
			textLabel.Visible = espEnabled
		else
			textLabel.Visible = false
		end
	end)
end

local function entityAdded(entity, color)
	if entity:IsA("Model") then
		esp(entity, color)
	end
	entity.ChildAdded:Connect(function(child)
		if child:IsA("Model") then
			esp(child, color)
		end
	end)
end

local function toggleESP()
	espEnabled = not espEnabled
	for _, entity in ipairs(entitiesFolder:GetChildren()) do
		if not entity:FindFirstChild("Health") then
			entityAdded(entity, Color3.fromRGB(255, 50, 0))
		elseif entity.Name ~= plr.Name then
			entityAdded(entity, Color3.fromRGB(173, 216, 230))
		end
	end
end

userInputService.InputBegan:Connect(function(input, busy)
	if busy then
		return
	end
	if input.KeyCode == Enum.KeyCode.RightBracket then
		toggleESP()
	end
end)

for _, entity in ipairs(entitiesFolder:GetChildren()) do
	if not entity:FindFirstChild("Health") then
		entityAdded(entity, Color3.fromRGB(255, 50, 0))
	elseif entity.Name ~= plr.Name then
		entityAdded(entity, Color3.fromRGB(173, 216, 230))
	end
end

entitiesFolder.ChildAdded:Connect(function(entity)
	repeat
		wait()
	until entity:FindFirstChild("HumanoidRootPart") and entity:FindFirstChild("Humanoid")
	if not entity:FindFirstChild("Health") then
		entityAdded(entity, Color3.fromRGB(255, 50, 0))
	elseif entity.Name ~= plr.Name then
		entityAdded(entity, Color3.fromRGB(173, 216, 230))
	end
end)

for _, mb in ipairs(npcsFolder.MissionNPC:GetChildren()) do
	if mb:FindFirstChild("Board") and #mb.Board:GetChildren() ~= 0 then
		local board = mb.Board
		instanceEsp(board.Union, Color3.fromRGB(200, 200, 50), "[" .. mb.Name .. "]")
	end
end

toggleESP()
