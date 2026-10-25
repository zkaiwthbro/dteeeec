local scripts = {
    "https://raw.githubusercontent.com/zkaiwthbro/dteeeec/refs/heads/main/chetsopen.lua",
    "https://raw.githubusercontent.com/zkaiwthbro/dteeeec/refs/heads/main/big.lua"
}

for i, url in ipairs(scripts) do
    task.spawn(function()
        -- Step 1: Fetch the script via HTTPGet safely
        local success, body = pcall(function()
            return game:HttpGet(url)
        end)
        
        if not success then
            warn("[Loader] #" .. i .. " HTTPGet failed: " .. tostring(body))
            return
        end

        -- Step 2: Check if GitHub returned a 404 or error page
        if body:find("404: Not Found") or body:find("403: Forbidden") then
            warn("[Loader] #" .. i .. " failed: The URL returned an error page (Check if the link/branch is correct).")
            return
        end

        -- Step 3: Compile the script using loadstring
        local fn, syntaxErr = loadstring(body)
        if not fn then
            warn("[Loader] #" .. i .. " Syntax Error in script: " .. tostring(syntaxErr))
            return
        end

        -- Step 4: Run the compiled function safely
        local runSuccess, runErr = pcall(fn)
        if runSuccess then
            print("[Loader] Loaded #" .. i .. " ✓")
        else
            warn("[Loader] #" .. i .. " Runtime Error during execution: " .. tostring(runErr))
        end
    end)
end

print("[Loader] All scripts starting...")
