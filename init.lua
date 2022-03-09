local modpath = minetest.get_modpath("air_light_level")

dofile(modpath .. "/air_light_level.lua")
dofile(modpath .. "/flood_light_level.lua")
--dofile(modpath .. "/air_light_level_debug.lua")
--dofile(modpath .. "/flood_light_level_debug.lua")

local get_node = minetest.get_node
local set_node = minetest.set_node


for i=1,13 do
    minetest.register_abm({
        label = "air light spreading" .. i,
        nodenames = {"flood_light_level:" .. i},
        neighbors = {},
        interval = 1.0,
        chance = 1,
        catch_up = true,
        action = function(pos, node)
                local dirs = {
                    vector.new(pos.x+1,pos.y,pos.z),
                    vector.new(pos.x-1,pos.y,pos.z),
                    vector.new(pos.x,pos.y+1,pos.z), --dirs[3] = up
                    vector.new(pos.x,pos.y-1,pos.z), --dirs[4] = down
                    vector.new(pos.x,pos.y,pos.z+1),
                    vector.new(pos.x,pos.y,pos.z-1)
                }
                for v = 1, 6 do
                    if get_node(dirs[3]).name == "air" then --if there is an air node above then
                        if get_node(dirs[4]).name == "air_light_level:" .. i then --if node below is not flood type then
                            set_node(dirs[4],{name="flood_light_level:" .. i}) --node below become flood node
                        end
                        set_node(pos,{name="air"}) --turn self into air
                    break
                    end

                    local node = get_node(dirs[v]).name
                    local node_above = get_node(vector.add(dirs[v],(vector.new(0,1,0)))).name
                    if node == "air" and node_above ~= "air" then
                        set_node(dirs[v],{name="flood_light_level:" .. i}) --spread
                    end
                    if v == 6 and (get_node(dirs[3]).name == "flood_light_level:" .. i or get_node(dirs[3]).name == "air_light_level:" .. i) then --if end of loop and node above is flood type then
                        set_node(pos,{name="air_light_level:" .. i}) --become a still node
                    end
                end
        end
    })
end
