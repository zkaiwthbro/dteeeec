local function optimizePrompt(prompt)
    if prompt:IsA("ProximityPrompt") then
        prompt.HoldDuration = 0
        prompt.RequiresLineOfSight = false

        prompt:GetPropertyChangedSignal("HoldDuration"):Connect(function()
            if prompt.HoldDuration > 0 then
                prompt.HoldDuration = 0
            end
        end)

        prompt:GetPropertyChangedSignal("RequiresLineOfSight"):Connect(function()
            if prompt.RequiresLineOfSight then
                prompt.RequiresLineOfSight = false
            end
        end)
    end
end

for _, v in pairs(workspace:GetDescendants()) do
    optimizePrompt(v)
end

workspace.DescendantAdded:Connect(optimizePrompt)
