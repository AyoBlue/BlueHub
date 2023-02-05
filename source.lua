local Players = game:GetService('Players')
local plr = game:GetService('Players').LocalPlayer
local RunService = game:GetService('RunService')
local ReplicatedStorage = game:GetService('ReplicatedStorage')
local repo = 'https://raw.githubusercontent.com/wally-rblx/LinoriaLib/main/'
local lib = loadstring(game:HttpGet(repo .. 'Library.lua'))()
local theme = loadstring(game:HttpGet(repo .. 'addons/ThemeManager.lua'))()
local save = loadstring(game:HttpGet(repo .. 'addons/SaveManager.lua'))()
local fonts = {
    ['UI'] = 0,
    ['System'] = 1,
    ['Plex'] = 2,
    ['Monospace'] = 3
}
local camera = game.Workspace.CurrentCamera
local services = {
    Tabs = {}, 
    Settings = {
        ESP = {
            Toggle = false,
            ESPDistance = 5000,
            FontSize = 14,
            Font = 0,
            HealthBar = false,
            Tracers = false,
            Highlight = false,
            HighlightFillColor = Color3.fromRGB(151, 248, 255),
            HighlightFillTransparency = 0.5,
            HighlightOutlineColor = Color3.fromRGB(255, 255, 255),
            HighlightOutlineTransparency = 0
        }
    }
};

LPH_NO_VIRTUALIZE = function(...) return(...) end;

local games = {
    [212154879] = {
        Name = 'Swordburst 2',
        PlaceIds = {542351431, 548231754, 555980327, 572487908, 580239979, 566212942, 582198062, 548878321, 573267292, 2659143505, 5287433115, 11331145451},
        Settings = {
            Floors = {
                [1] = {
                    PlaceId = 542351431,
                    Name = 'Virhst Woodlands',
                    Mobs = {'None', 'Frenzy Boar', 'Hermit Crab', 'Wolf', 'Bear', 'Leapers', 'Earthen Crab', 'Earthen Boar', 'Crimsonite', 'Ruin Knight', 'Draconite', 'Ruined Kobold Knight', 'Ruin Kobold Knight', 'Dire Wolf', 'Ruined Kobold Lord', 'Rahjin the Thief King'}
                },
                [2] = {
                    PlaceId = 548231754,
                    Name = 'Redveil Grove',
                    Mobs = {'None', 'Leaf Beetle', 'Leaf Ogre', 'Leafray', 'Pearl Keeper', 'Bushback Tortoise', 'Wasp', 'Giant Ruins Hornet', 'Pearl Guardian', 'Gorrock the Grove Protector', 'Borik the BeeKeeper'}
                },
                [3] = {
                    PlaceId = 555980327,
                    Name = 'Avalanche Expanse',
                    Mobs = {'None', 'Snowgre', 'Angry Snowman', 'Icewhal', 'Ice Elemental', 'Snowhorse', 'Ice Walker', 'Alpha Icewhal', 'Qerach The Forgotten Golem', 'Ra\'thae the Ice King'}
                },
                [4] = {
                    PlaceId = 572487908,
                    Name = 'Hidden Wilds',
                    Mobs = {'None', 'Wattlechin Crocodile', 'Birchman', 'Treehorse', 'Treeray', 'Boneling', 'Bamboo Spiderling', 'Bamboo Spider', 'Dungeon Dweller', 'Lion Protector', 'Rotling', 'Irath the Lion'}
                },
                [5] = {
                    PlaceId = 580239979,
                    Name = 'Desolate Dunes',
                    Mobs = {'None', 'Girdled Lizard', 'Angry Cactus', 'Desert Vulture', 'Sand Scorpion', 'Giant Centipede', 'Green Patrolman', 'Centaurian Defender', 'Patrolman Elite', 'Fire Scorpion', 'Sa\'jun the Centurian Chieftain'}
                },
                [6] = {
                    PlaceId = 566212942,
                    Name = 'Helmfirth',
                    Mobs = {'None'}
                },
                [7] = {
                    PlaceId = 582198062,
                    Name = 'Entoloma Gloomlands',
                    Mobs = {'None', 'Jelly Wisp', 'Firefly', 'Shroom Back Clam', 'Gloom Shroom', 'Horned Sailfin Iguana', 'Blightmouth', 'Snapper', 'Frogazoid', 'Smashroom'}
                },
                [8] = {
                    PlaceId = 548878321,
                    Name = 'Blooming Plateau',
                    Mobs = {'None', 'Giant Praying Mantis', 'Petal Knight', 'Leaf Rhino', 'Sky Raven', 'Wingless Hippogriff', 'Forest Wanderer', 'Dungeon Crusador', 'Hippogriff', 'Formaug the Jungle Giant'}
                },
                [9] = {
                    PlaceId = 573267292,
                    Name = 'Va\' Rok',
                    Mobs = {'None', 'Batting Eye', 'Lingerer', 'Fishrock Spider', 'Reptasaurus', 'Ent', 'Undead Warrior', 'Enraged Lingerer', 'Undead Berserker', 'Polyserpant', 'Gargoyle Reaper', 'Mortis the Flaming Sear'}
                },
                [10] = {
                    PlaceId = 2659143505,
                    Name = 'Transylvania',
                    Mobs = {'None', 'Winged Minion', 'Clay Giant', 'Wendigo', 'Grunt', 'Guard Hound', 'Minion', 'Shady Villager', 'Undead Servant', 'Baal, The Tormentor', 'Grim the Overseer'}
                },
                [11] = {
                    PlaceId = 5287433115,
                    Name = 'Hypersiddia',
                    Mobs = {'None', 'Reaper', 'Elite Reaper', 'DJ Reaper', 'Soul Eater', 'Shadow Figure', 'Meta Figure', '???????', 'Rogue Android', 'Command Falcon', 'Armageddon Eagle', 'Sentry', 'Watcher', 'Wa', 'Ra', 'Da', 'Ka', 'Za, the Eldest', 'Duality Reaper', 'Saurus, the All-Seeing'}
                },
                [12] = {
                    PlaceId = 11331145451,
                    Name = 'Spooky Halloween',
                    Mobs = {'None', 'Black Widow', 'Bloodshard Spider', 'Spiritual Hound', 'Hostile Omen', 'Harbinger', 'Mutated Pumpkin', 'Stone Gargoyle', 'Cursed Skeleton', 'Werewolf', 'Mud Brute', 'Sorcerer', 'Elkwood Giant', 'Alpha Werewolf', 'The Cucurbita', 'Bulswick, the Elkwood Behemoth', 'Egnor, the Undead King', 'Magnor, the Necromancer', 'Headless Horseman'}
                }
            },
            Local = {
                WalkSpeed = 16,
                JumpPower = 50,
                WalkSpeedB = false,
                JumpPowerB = false,
                InfiniteJump = false,
                LeaveDelay = 0,
                Leave = false,
                NewFloor = nil
            },
            Game = {
                KillAura = false,
                AutoFarm = false,
                ToggleMob = false,
                TargetMob = nil,
                CurrentMob = nil,
                Distance = 0,
                TweenSpeed = 50,
                AttackSpeed = 0.3,
                Area = 'Above'
            },
            Functions = {
                ['AutoFarm'] = function(mob)
                    local loop;
                    services.Settings.Game.CurrentMob = mob
                    local start = os.clock()
                    local distance = (plr.Character.PrimaryPart.Position - mob.PrimaryPart.Position).Magnitude
                    local estimated = distance / services.Settings.Game.TweenSpeed
                    local current = plr.Character.HumanoidRootPart.CFrame
                    loop = RunService.Heartbeat:Connect(function()
                        if mob and mob.PrimaryPart and plr.Character and plr.Character.PrimaryPart then
                            local target = mob.PrimaryPart
                            local delta = (os.clock() - start) / estimated
                            local newpos = target.CFrame
                            if services.Settings.Game.Area == 'Above' then
                                newpos = newpos + Vector3.new(0, services.Settings.Game.Distance, 0)
                            elseif services.Settings.Game.Area == 'Side' then
                                newpos = newpos + Vector3.new(services.Settings.Game.Distance, 0, 0)
                            elseif services.Settings.Game.Area == 'Below' then
                                newpos = newpos + Vector3.new(0, -services.Settings.Game.Distance, 0)
                            end
                            if delta > 1 then delta = 1 end
                            plr.Character.HumanoidRootPart.CFrame = current:Lerp(newpos, delta)
                        end
                    end)
                    task.spawn(function()
                        while task.wait() do
                            if not mob then
                                break
                            end
                            if mob ~= services.Settings.Game.CurrentMob then
                                break
                            end
                            if not plr.Character then
                                break
                            end
                            if not plr.Character:FindFirstChild('Humanoid') then
                                break
                            end
                            if plr.Character.Humanoid.Health <= 0 then
                                break
                            end
                            if not mob:FindFirstChild('Entity') then
                                break
                            end
                            if not mob.Entity:FindFirstChild('Health') then
                                break
                            end
                            if mob.Entity.Health.Value == 0 then
                                break
                            end
                            if not mob.PrimaryPart then
                                break
                            end
                            if not services.Settings.Game.AutoFarm then
                                break
                            end
                        end
                        if loop then loop:Disconnect() end
                        services.Settings.Game.CurrentMob = nil
                    end)
                end,
                ['FindDistance'] = function(obj1, obj2)
                    return (obj1.Position - obj2.Position).Magnitude
                end
            }
        },
        Tabs = {
            [1] = 'Main',
            [2] = 'Local',
            [3] = 'Visuals',
            [4] = 'Config',
            [5] = 'Credits'
        }
    }
};

if games[game.GameId] then
    services.Game = games[game.GameId];
    if table.find(services.Game.PlaceIds, game.PlaceId) then
        services.Window = lib:CreateWindow({
            Title = services.Game.Name,
            Center = true,
            AutoShow = true
        });
        theme:SetLibrary(lib)
        save:SetLibrary(lib)
        theme:SetFolder('SoftHub')
        save:SetFolder('SoftHub/' .. game.GameId)
        local tab = 1
        while task.wait() do
            local name = services.Game.Tabs[tab]
            if not name then break end
            services.Tabs[name] = {
                Tab = services.Window:AddTab(name),
                Boxes = {}
            }
            tab = tab + 1
        end
        for key, var in pairs(services.Game.Settings) do
            if not services.Settings[key] then
                services.Settings[key] = var
            end
        end
    else
        return lib:Notify('Script cannot be ran in this place.', 5);
    end
else
   return plr:Kick('Invalid Game.');
end

if services.Tabs.Config then
    services.Tabs.Config.Boxes.Menu = services.Tabs.Config.Tab:AddLeftGroupbox('Menu')
    services.Tabs.Config.Boxes.Menu:AddButton('Unload', function() lib:Unload() end)
    services.Tabs.Config.Boxes.Menu:AddLabel('Menu Bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu Keybind' })

    services.Tabs.Credits.Boxes.Credits = services.Tabs.Credits.Tab:AddLeftGroupbox('Credits')
    services.Tabs.Credits.Boxes.Credits:AddLabel('Scripter: AyoBlue#0001')
    services.Tabs.Credits.Boxes.Credits:AddLabel('UI Developer: ' .. 'WallyTheBird')
    services.Tabs.Credits.Boxes.Credits:AddButton('Discord Invite', function() setclipboard('https://discord.gg/cjcVh6f4AJ') end)
    services.Tabs.Credits.Boxes.Credits:AddButton('Repository', function() setclipboard('https://github.com/wally-rblx/LinoriaLib') end)

    save:BuildConfigSection(services.Tabs.Config.Tab) 
    theme:ApplyToTab(services.Tabs.Config.Tab)
end

if services.Tabs.Visuals then
    function AddPlayerToESP(Player)
        local Character = Player.Character or Player.CharacterAdded:Wait()

        local Text = Drawing.new("Text")
        Text.Center = true
        Text.Outline = true
        Text.Visible = false
        Text.Color = Color3.fromRGB(255, 255, 255)
    
        RunService.RenderStepped:Connect(function()
            if Player.Character then
                if services.Settings.ESP.Toggle then
                    ---------------------------------[Text Positioning]---------------------------------
                    local hrp = Player.Character:FindFirstChild('HumanoidRootPart')
                    if hrp then
                        local pos, visible = camera:WorldToViewportPoint(Player.Character.Head.Position)
                        if visible then
                            Text.Font = services.Settings.ESP.Font
                            Text.Size = services.Settings.ESP.FontSize
                            Text.Position = Vector2.new(pos.X, pos.Y)
                            if plr.Character and plr.Character:FindFirstChild('HumanoidRootPart') then
                                local distance = math.round((plr.Character.HumanoidRootPart.Position - hrp.Position).Magnitude)
                                if distance <=  services.Settings.ESP.ESPDistance then
                                    Text.Text = Player.Name .. ' [' .. distance .. ']'
                                    Text.Visible = true
                                else
                                    Text.Visible = false
                                end
                            else
                                Text.Visible = false
                            end
                        else
                            Text.Visible = false
                        end
                    else
                        Text.Visible = false
                    end
                    ---------------------------------[Highlights]---------------------------------
                    if services.Settings.ESP.Highlight then
                        if not Player.Character:FindFirstChild('Highlight') then
                            local highlight = Instance.new('Highlight', Player.Character)
                            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                            highlight.Enabled = true
                            highlight.FillColor = services.Settings.ESP.HighlightFillColor
                        else
                            if not Player.Character.Highlight.Enabled then Player.Character.Highlight.Enabled = true end
                            Player.Character.Highlight.FillColor = services.Settings.ESP.HighlightFillColor
                            Player.Character.Highlight.FillTransparency = services.Settings.ESP.HighlightFillTransparency
                            Player.Character.Highlight.OutlineColor = services.Settings.ESP.HighlightOutlineColor
                            Player.Character.Highlight.OutlineTransparency = services.Settings.ESP.HighlightOutlineTransparency
                        end
                    end
                else
                    if Text.Visible then Text.Visible = false end
                end
            else
                if Text.Visible then Text.Visible = false end
            end
        end)
    end

    for _, Player in pairs(Players:GetPlayers()) do
        if Player ~= plr then
            task.spawn(AddPlayerToESP, Player)
        end
    end
    
    Players.PlayerAdded:Connect(function(Player)
        if Player ~= plr then
            task.spawn(AddPlayerToESP, Player)
        end
    end)

    services.Tabs.Visuals.Boxes.ESP = services.Tabs.Visuals.Tab:AddLeftGroupbox('ESP Settings')
    services.Tabs.Visuals.Boxes.Highlights = services.Tabs.Visuals.Tab:AddRightGroupbox('Highlights Settings')

    services.Tabs.Visuals.Boxes.ESP:AddToggle('ESP', {
        Text = 'Toggle ESP',
        Default = false,
        Tooltip = 'See all of the players!'
    })
    services.Tabs.Visuals.Boxes.ESP:AddSlider('ESPDistance', {
        Text = 'Max ESP Distance',
        Default = 5000,
        Min = 0,
        Max = 10000,
        Rounding = 0,
        Compact = false
    })
    services.Tabs.Visuals.Boxes.ESP:AddSlider('FontSize', {
        Text = 'Font Size',
        Default = 14,
        Min = 14,
        Max = 30,
        Rounding = 0,
        Compact = false
    })
    services.Tabs.Visuals.Boxes.ESP:AddDropdown('Font', {
        Values = {'UI', 'System', 'Plex', 'Monospace'},
        Text = 'Text Font',
        Default = 1,
        Multi = false
    })
    services.Tabs.Visuals.Boxes.ESP:AddToggle('HealthBar', {
        Text = 'Show Health',
        Default = false,
        Tooltip = 'Show the Players Health!'
    })
    services.Tabs.Visuals.Boxes.ESP:AddToggle('Tracers', {
        Text = 'Show Tracers',
        Default = false,
        Tooltip = 'Create tracers to the players!'
    })
    services.Tabs.Visuals.Boxes.ESP:AddToggle('Highlight', {
        Text = 'Show Highlights',
        Default = false,
        Tooltip = 'Create highlights on the player!'
    })
    services.Tabs.Visuals.Boxes.Highlights:AddLabel('Color'):AddColorPicker('HighlightFillColor', {
        Default = services.Settings.ESP.HighlightFillColor,
        Title = 'Highlight Fill Color'
    })
    services.Tabs.Visuals.Boxes.Highlights:AddSlider('HighlightFillTransparency', {
        Text = 'Highlight Fill Transparency',
        Default = 0.5,
        Min = 0,
        Max = 1,
        Rounding = 2,
        Compact = false
    })
    services.Tabs.Visuals.Boxes.Highlights:AddLabel('Color'):AddColorPicker('HighlightOutlineColor', {
        Default = services.Settings.ESP.HighlightOutlineColor,
        Title = 'Highlight Outline Color'
    })
    services.Tabs.Visuals.Boxes.Highlights:AddSlider('HighlightOutlineTransparency', {
        Text = 'Highlight Outline Transparency',
        Default = 0,
        Min = 0,
        Max = 1,
        Rounding = 2,
        Compact = false
    })
    Toggles.ESP:OnChanged(function()
        services.Settings.ESP.Toggle = Toggles.ESP.Value
    end)
    Options.ESPDistance:OnChanged(function()
        services.Settings.ESP.ESPDistance = Options.ESPDistance.Value
    end)
    Options.FontSize:OnChanged(function()
        services.Settings.ESP.FontSize = Options.FontSize.Value
    end)
    Options.Font:OnChanged(function()
        services.Settings.ESP.Font = fonts[Options.Font.Value]
    end)
    Toggles.HealthBar:OnChanged(function()
        services.Settings.ESP.HealthBar = Toggles.HealthBar.Value
    end)
    Toggles.Tracers:OnChanged(function()
        services.Settings.ESP.Tracers = Toggles.Tracers.Value
    end)
    Toggles.Highlight:OnChanged(function()
        services.Settings.ESP.Highlight = Toggles.Highlight.Value
    end)
    Options.HighlightFillColor:OnChanged(function()
        services.Settings.ESP.HighlightFillColor = Options.HighlightFillColor.Value
    end)
    Options.HighlightFillTransparency:OnChanged(function()
        services.Settings.ESP.HighlightFillTransparency = Options.HighlightFillTransparency.Value
    end)
    Options.HighlightOutlineColor:OnChanged(function()
        services.Settings.ESP.HighlightOutlineColor = Options.HighlightOutlineColor.Value
    end)
    Options.HighlightOutlineTransparency:OnChanged(function()
        services.Settings.ESP.HighlightOutlineTransparency = Options.HighlightOutlineTransparency.Value
    end)
end

if services.Game then
    print('Connected Game:', services.Game.Name)
    if services.Game.Name == 'Swordburst 2' then
        local isinvisible = false
        local index, newindex
        local Modules;
        local RPCKey;
        local Mobs_ = {'None'}
        local floors = {}
        local Cooldown = {}
        local Profile = ReplicatedStorage.Profiles:WaitForChild(plr.Name)
        local Vel, XP
        local SetData = {
            EXP = Profile.Stats.Exp.Value,
            Vel = Profile.Stats.Vel.Value
        }

        for i,v in ipairs(services.Game.Settings.Floors) do
            floors[i] = v.Name
        end
        
        LPH_NO_VIRTUALIZE(function()
            for _, v in pairs(getgc(true)) do
                if type(v) == 'table' then
                    local success, key = pcall(function()
                        return v.Services 
                    end)
                    if success and key then
                        Modules = key
                        break
                    end
                end
            end
        end)()

        Profile.Stats.Exp.Changed:Connect(function()
            if XP then
                local var = Profile.Stats.Exp.Value - SetData.EXP
                XP:SetText('Gained XP: ' .. var)
            end
        end)
        Profile.Stats.Vel.Changed:Connect(function()
            if Vel then
                local var = Profile.Stats.Vel.Value - SetData.Vel
                Vel:SetText('Gained Vel: ' .. var)
            end
        end)

        if Modules then
            RPCKey = debug.getupvalues(Modules.Combat.Init, 1)[2]
        else
            plr:Kick('RPCKey could not be found.')
        end

        for _, Data in pairs(services.Settings.Floors) do
            if Data.PlaceId == game.PlaceId then
                Mobs_ = Data.Mobs
            end
        end

        plr.CharacterAdded:Connect(function()
            if isinvisible then
                isinvisible = false
            end
        end)
        ----------------------[Main]------------------------
        services.Tabs.Main.Boxes.Farm = services.Tabs.Main.Tab:AddLeftGroupbox('Main')
        services.Tabs.Main.Boxes.Settings = services.Tabs.Main.Tab:AddRightGroupbox('Settings')
        services.Tabs.Main.Boxes.Logs = services.Tabs.Main.Tab:AddLeftGroupbox('Logs')

        services.Tabs.Main.Boxes.Farm:AddDropdown('Mobs', {
            Values = Mobs_,
            Text = 'Mobs',
            Default = 1,
            Multi = false
        })
        services.Tabs.Main.Boxes.Farm:AddToggle('ToggleMob', {
            Text = 'Prioritize Mob',
            Default = false,
            Tooltip = 'Prioritize the specified mob!'
        })
        services.Tabs.Main.Boxes.Farm:AddToggle('AutoFarm', {
            Text = 'Auto Farm',
            Default = false,
            Tooltip = 'Self explanatory.'
        })
        services.Tabs.Main.Boxes.Farm:AddToggle('KillAura', {
            Text = 'Kill Aura',
            Default = false,
            Tooltip = 'Self explanatory.'
        })
        services.Tabs.Main.Boxes.Settings:AddSlider('Distance', {
            Text = 'Mob Distance',
            Default = 0,
            Min = 0,
            Max = 21,
            Rounding = 0,
            Compact = false
        })
        services.Tabs.Main.Boxes.Settings:AddSlider('TweenSpeed', {
            Text = 'Tween Speed',
            Default = 50,
            Min = 50,
            Max = 200,
            Rounding = 0,
            Compact = false
        })
        services.Tabs.Main.Boxes.Settings:AddSlider('AttackSpeed', {
            Text = 'Attack Speed',
            Default = 0.3,
            Min = 0.3,
            Max = 1,
            Rounding = 1,
            Compact = false
        })
        services.Tabs.Main.Boxes.Settings:AddDropdown('Area', {
            Values = {'Above', 'Side', 'Below'},
            Text = 'Farm Area',
            Default = 1,
            Multi = false
        })
        Vel = services.Tabs.Main.Boxes.Logs:AddLabel('Gained Vel: ')
        XP = services.Tabs.Main.Boxes.Logs:AddLabel('Gained XP: ')
        ----------------------[Local]------------------------
        services.Tabs.Local.Boxes.Player = services.Tabs.Local.Tab:AddLeftGroupbox('Local Player')
        services.Tabs.Local.Boxes.Admin = services.Tabs.Local.Tab:AddRightGroupbox('Admins')

        services.Tabs.Local.Boxes.Player:AddSlider('WalkSpeed', {
            Text = 'WalkSpeed',
            Default = 16,
            Min = 16,
            Max = 150,
            Rounding = 0,
            Compact = false
        })
        services.Tabs.Local.Boxes.Player:AddToggle('WalkSpeedB', {
            Text = 'Toggle WalkSpeed',
            Default = false,
            Tooltip = 'Toggle your WalkSpeed!'
        })
        services.Tabs.Local.Boxes.Player:AddSlider('JumpPower', {
            Text = 'JumpPower',
            Default = 50,
            Min = 50,
            Max = 100,
            Rounding = 0,
            Compact = false
        })
        services.Tabs.Local.Boxes.Player:AddToggle('JumpPowerB', {
            Text = 'Toggle JumpPower',
            Default = false,
            Tooltip = 'Toggle your JumpPower!'
        })
        services.Tabs.Local.Boxes.Player:AddToggle('InfiniteJump', {
            Text = 'Infinite Jump',
            Default = false,
            Tooltip = 'Toggle Inf Jump!'
        })
        services.Tabs.Local.Boxes.Player:AddButton('Invisible', function()
            local Character = plr.Character
            if Character and Character:FindFirstChild('HumanoidRootPart') then
                plr.Character.Archivable = true
                local oldhumanoid = plr.Character:Clone()
                local hrp = Character.HumanoidRootPart
                local root = Character.LowerTorso.Root:Clone()
                local pos = hrp.CFrame

                hrp.Parent = game.Workspace
                Character.PrimaryPart = hrp
                hrp.Parent = Character
                root.Parent = Character.LowerTorso
                hrp.CFrame = pos

                oldhumanoid.Parent = game.Workspace
                oldhumanoid.HumanoidRootPart.CFrame = plr.Character.HumanoidRootPart.CFrame
                oldhumanoid.HumanoidRootPart.Anchored = true
                for _, obj in pairs(oldhumanoid:GetDescendants()) do
                    if obj:IsA('Part') or obj:IsA('MeshPart') then
                        obj.Transparency = .7
                    end
                end
            end
        end)
        services.Tabs.Local.Boxes.Player:AddDropdown('Floors', {
            Values = floors,
            Text = 'Floors',
            Default = 1,
            Multi = false
        })
        services.Tabs.Local.Boxes.Player:AddButton('Teleport', function()
            if services.Settings.Local.NewFloor then
                for _, floor in pairs(services.Game.Settings.Floors) do
                    if floor.Name == services.Settings.Local.NewFloor then
                        local profile = ReplicatedStorage.Profiles:WaitForChild(plr.Name)
                        if profile.Locations:FindFirstChild(floor.PlaceId) then
                            game.ReplicatedStorage.Function:InvokeServer("Teleport", {"Teleport", floor.PlaceId})
                        end
                    end
                end
            end
        end)
        services.Tabs.Local.Boxes.Admin:AddToggle('Leave', {
            Text = 'Leave On Join',
            Default = false,
            Tooltip = 'Leave when an admin joins!'
        })
        services.Tabs.Local.Boxes.Admin:AddSlider('LeaveDelay', {
            Text = 'Leave Delay',
            Default = 0,
            Min = 0,
            Max = 5,
            Rounding = 0,
            Compact = false
        })
        Toggles.ToggleMob:OnChanged(function()
            services.Settings.Game.ToggleMob = Toggles.ToggleMob.Value
        end)
        Toggles.AutoFarm:OnChanged(function()
            services.Settings.Game.AutoFarm = Toggles.AutoFarm.Value
        end)
        Toggles.KillAura:OnChanged(function()
            services.Settings.Game.KillAura = Toggles.KillAura.Value
        end)
        Toggles.WalkSpeedB:OnChanged(function()
            services.Settings.Local.WalkSpeedB = Toggles.WalkSpeedB.Value
        end)
        Toggles.JumpPowerB:OnChanged(function()
            services.Settings.Local.JumpPowerB = Toggles.JumpPowerB.Value
        end)
        Toggles.InfiniteJump:OnChanged(function()
            services.Settings.Local.InfiniteJump = Toggles.InfiniteJump.Value
        end)
        Toggles.Leave:OnChanged(function()
            services.Settings.Local.Leave = Toggles.Leave.Value
        end)
        Options.WalkSpeed:OnChanged(function()
            services.Settings.Local.WalkSpeed = Options.WalkSpeed.Value
        end)
        Options.JumpPower:OnChanged(function()
            services.Settings.Local.JumpPower = Options.JumpPower.Value
        end)
        Options.Mobs:OnChanged(function()
            services.Settings.Game.TargetMob = Options.Mobs.Value
        end)
        Options.Distance:OnChanged(function()
            services.Settings.Game.Distance = Options.Distance.Value
        end)
        Options.TweenSpeed:OnChanged(function()
            services.Settings.Game.TweenSpeed = Options.TweenSpeed.Value
        end)
        Options.AttackSpeed:OnChanged(function()
            services.Settings.Game.AttackSpeed = Options.AttackSpeed.Value
        end)
        Options.Area:OnChanged(function()
            services.Settings.Game.Area = Options.Area.Value
        end)
        Options.LeaveDelay:OnChanged(function()
            services.Settings.Local.LeaveDelay = Options.LeaveDelay.Value
        end)
        Options.Floors:OnChanged(function()
            services.Settings.Local.NewFloor = Options.Floors.Value
        end)

        task.spawn(LPH_NO_VIRTUALIZE(function()
            while task.wait() do
                local target;
                if plr.Character then
                    if plr.Character:FindFirstChild('Humanoid') and plr.Character:FindFirstChild('HumanoidRootPart') then
                        if services.Settings.Local.WalkSpeedB then
                            plr.Character.Humanoid.WalkSpeed = services.Settings.Local.WalkSpeed
                        end
                        if services.Settings.Local.JumpPowerB then
                            plr.Character.Humanoid.JumpPower = services.Settings.Local.JumpPower
                        end
                        if services.Settings.Game.AutoFarm then
                            plr.Character.HumanoidRootPart.Velocity = Vector3.new()
                            plr.Character.HumanoidRootPart.RotVelocity = Vector3.new()
                        end
                    end
                end
                for _, mob in pairs(game.Workspace.Mobs:GetChildren()) do
                    if mob:IsA('Model') and plr.Character then
                        local newmob = mob.PrimaryPart
                        local hrp = plr.Character:FindFirstChild('HumanoidRootPart')
                        local entity = mob:FindFirstChild('Entity')
                        if services.Settings.Game.TargetMob == 'None' or services.Settings.Game.TargetMob == mob.Name then
                            if hrp and newmob and entity and entity:FindFirstChild('Health') and entity.Health.Value > 0 then
                                if not target then
                                    if Cooldown[mob] then
                                        if Cooldown[mob].CanAttack then
                                            target = mob
                                        end
                                    else
                                        target = mob
                                    end
                                else
                                    if target.PrimaryPart then
                                        local x = services.Settings.Functions['FindDistance'](target.PrimaryPart, hrp)
                                        local y = services.Settings.Functions['FindDistance'](newmob, hrp)
                                        if x > y then
                                            if Cooldown[mob] then
                                                if Cooldown[mob].CanAttack then
                                                    target = mob
                                                end
                                            else
                                                target = mob
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        if hrp and services.Settings.Game.KillAura and newmob and entity and entity:FindFirstChild('Health') and entity.Health.Value > 0 and (hrp.Position - newmob.Position).Magnitude < 30 then
                            if not Cooldown[mob] then
                                Cooldown[mob] = {
                                    Cooldown = os.clock(),
                                    CanAttack = true,
                                    Attacks = 0,
                                    Health = entity.Health.Value
                                }
                            else
                                if Cooldown[mob].Health == entity.Health.Value then -- Health Didn't Change bruh.
                                    if Cooldown[mob].Attacks >= 10 then
                                        Cooldown[mob].Attacks = 0
                                        Cooldown[mob].CanAttack = false
                                        task.spawn(function()
                                            task.wait(1)
                                            Cooldown[mob].CanAttack = true
                                        end)
                                    else
                                        Cooldown[mob].Attacks = Cooldown[mob].Attacks + 1
                                    end
                                else
                                    Cooldown[mob].Attacks = 0
                                    Cooldown[mob].CanAttack = true
                                end
                            end
                            if os.clock() >= Cooldown[mob].Cooldown and Cooldown[mob].CanAttack then
                                Cooldown[mob].Cooldown =  os.clock() + services.Settings.Game.AttackSpeed
                                task.spawn(function()
                                    game.ReplicatedStorage.Event:FireServer("Combat", RPCKey, {"Attack", nil, "1", mob})
                                    Cooldown[mob].Health = entity.Health.Value
                                end)
                            end
                        end
                    end
                end
                if target and services.Settings.Game.AutoFarm then
                    if not services.Settings.Game.CurrentMob then
                        services.Settings.Functions['AutoFarm'](target)
                    elseif services.Settings.Game.CurrentMob ~= target then
                        services.Settings.Functions['AutoFarm'](target)
                    end
                end
                task.wait(services.Settings.Game.AttackSpeed)
            end
        end))
        index = hookmetamethod(game, '__index', LPH_NO_VIRTUALIZE(function(self, key)
            if not checkcaller() then
                if tostring(self) == 'Humanoid' and tostring(key) == 'WalkSpeed' then
                    return 16
                elseif tostring(self) == 'Humanoid' and tostring(key) == 'JumpPower' then
                    return 50
                end
            end
            return index(self, key)
        end))
        newindex = hookmetamethod(game, '__index', LPH_NO_VIRTUALIZE(function(self, key, var)
            if not checkcaller() then
                if tostring(self) == 'Humanoid' and tostring(key) == 'WalkSpeed' then
                    if services.Settings.Local.WalkSpeedB then
                        return newindex(self, key, services.Settings.Local.WalkSpeed)
                    end
                elseif tostring(self) == 'Humanoid' and tostring(key) == 'JumpPower' then
                    if services.Settings.Local.JumpPowerB then
                        return newindex(self, key, services.Settings.Local.JumpPower)
                    end
                end
            end
            return newindex(self, key, var)
        end))
    end
else
    print('Could not find the game..')
end
