local scripts = {
    "https://raw.githubusercontent.com/zkaiwthbro/dteeeec/refs/heads/main/chetsopen.lua",
    "https://raw.githubusercontent.com/zkaiwthbro/dteeeec/refs/heads/main/big.lua"
}

for i, url in ipairs(scripts) do
    task.spawn(function()
        local ok, err = pcall(function()
            local success, result = pcall(function()
                return game:HttpGet(url)
            end)
            if success and result then
                local fn, syntaxErr = loadstring(result)
                if fn then
                    fn()
                else
                    error("Loadstring error: " .. tostring(syntaxErr))
                end
            else
                error("HTTPGet failed: " .. tostring(result))
            end
        end)
        
        if ok then
            print("[Loader] Loaded #" .. i .. " ✓")
        else
            warn("[Loader] Failed #" .. i .. ": " .. tostring(err))
        end
    end)
end

print("[Loader] All scripts starting...")
