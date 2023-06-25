 -- rounds numbers with specified decimal places (ex: round(1.2345, 3) == 1.235)
function roundnew(number, digits)
	local num = number * 10 ^ digits
	num = num>=0 and math.floor(num+0.5) or math.ceil(num-0.5) -- round number (including negative numbers)
	return num / (10 ^ digits)
end

local function setup(i)
	
	if i:FindFirstChild("Head") and i.Head:FindFirstChild("BillboardGui") then i.Head.BillboardGui:Destroy() end
	if i:FindFirstChild("Highlight") then i.Highlight:Destroy() end
	local highlight = Instance.new("Highlight", i)
	--highlight.OutlineTransparency = 1
	highlight.FillColor = Color3.fromRGB(255, 0, 0)
	highlight.FillTransparency = 0.5
	
	i.Blocking:GetPropertyChangedSignal("Value"):Connect(function()
		if i.Blocking.Value then
			highlight.FillColor = Color3.fromRGB(255, 0, 0)
		else
			highlight.FillColor = Color3.fromRGB(0, 255, 0)
		end
	end)
	
	-- Gui to Lua
	-- Version: 3.2
	
	-- Instances:
	
	local BillboardGui = Instance.new("BillboardGui")
	TextLabel = Instance.new("TextLabel")
	
	--Properties:
	
	BillboardGui.Parent = i.Head
	BillboardGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	BillboardGui.Active = true
	BillboardGui.Adornee = i.Head
	BillboardGui.AlwaysOnTop = true
	BillboardGui.LightInfluence = 1.000
	BillboardGui.MaxDistance = 35.000
	BillboardGui.Size = UDim2.new(4, 0, 1, 0)
	BillboardGui.SizeOffset = Vector2.new(0, 2)
	BillboardGui.StudsOffset = Vector3.new(0, -0.8, 0)
	
	TextLabel.Parent = BillboardGui
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Size = UDim2.new(1, 0, 1, 0)
	TextLabel.ZIndex = 0
	TextLabel.Font = Enum.Font.Oswald
	TextLabel.Text = "..."
	TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 39.000
	TextLabel.TextWrapped = true

	i.Blocking:GetPropertyChangedSignal("Value"):Connect(function()
		if not i.Blocking.Value then
		
			if i:FindFirstChild("Head") then i.Head.BillboardGui.TextLabel.TextColor3 = Color3.fromRGB(0, 255, 0) end
			number = 0
			
			repeat wait(0.05)
				number = number + 0.05
				if i:FindFirstChild("Head") then i.Head.BillboardGui.TextLabel.Text = roundnew(number, 4) end				
			until i.Blocking.Value or not i:FindFirstChild("Blocking") or i:FindFirstChild("Humanoid") and i.Humanoid.Health == 0
			
			if i:FindFirstChild("Head") then i.Head.BillboardGui.TextLabel.TextColor3 = Color3.fromRGB(255, 0, 0) end
		end
	end)
	
end

for _, dummy in pairs(game:GetService("Workspace").Live:GetChildren()) do
	if string.find(dummy.Name:lower(), "block dummy") then
		print(dummy.Name)
		setup(dummy)
	end
end

game:GetService("Workspace").Live.ChildAdded:Connect(function(dummy)
	if string.find(dummy.Name:lower(), "block dummy") then
		print(dummy.Name)
		repeat wait() until dummy:FindFirstChild("Blocking")
		setup(dummy)
	end
end)
