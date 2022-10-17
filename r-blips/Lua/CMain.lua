local QBCore = exports['qb-core']:GetCoreObject()

Citizen.CreateThread(function(args, source)
            for _, __b in pairs(CFG.ALL["blips"]) do
            __b._blip_ig = AddBlipForCoord(__b.x, __b.y, __b.z)
            SetBlipSprite(__b._blip_ig, __b._id_ig_)
            SetBlipDisplay(__b._blip_ig, __b.__type_ig_)
            SetBlipScale(__b._blip_ig, __b.__size__)
            SetBlipColour(__b._blip_ig, __b._colour_ig_)
            SetBlipAsShortRange(__b._blip_ig, true)
            BeginTextCommandSetBlipName("STRING") 
            AddTextComponentString(__b._tile_ig_close_)
            EndTextCommandSetBlipName(__b._blip_ig)
            RegisterCommand('blip', function(source, args)
                if args[1] == CFG.ALL["commands"]["open"] then 
                    if QBCore.Functions.GetPlayerData().job.name == __b._job_ig_ then 
                        SetBlipColour(__b._blip_ig, __b._open_color)
                        SetBlipScale(__b._blip_ig, __b._size_open_)
                        BeginTextCommandSetBlipName("STRING") 
                        AddTextComponentString(__b._tile_ig_open_)
                        EndTextCommandSetBlipName(__b._blip_ig)
                    else 
                        QBCore.Functions.Notify(CFG.ALL["lang"]["noti_1"])   
                    end
                elseif args[1] == CFG.ALL["commands"]["close"]  then 
                    SetBlipScale(__b._blip_ig, __b.__size__)
                    SetBlipColour(__b._blip_ig, __b._colour_ig_)
                    BeginTextCommandSetBlipName("STRING") 
                    AddTextComponentString(__b._tile_ig_close_)
                    EndTextCommandSetBlipName(__b._blip_ig)
               end
            end, false)
        end
 end)