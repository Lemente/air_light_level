--for light node that don't spread
for i=1,14 do
    minetest.register_node("air_light_level:" .. i, {

        description = "Air: light level " .. i,
--[[
        drawtype = "airlike",
]]--        
        drawtype = 'nodebox',
        tiles = {"link.png"},
        paramtype2 = 'facedir',
        paramtype = "light",
        sunlight_propagates = true, --shouldn't replace sunlight in case of transparent ceiling

        light_source = i,

        walkable     = false,
        pointable    = true, --true for testing purposes
        diggable     = false,
        buildable_to = true, 

        air_equivalent = true,
        floodable = true,
        drop = "",
        groups = {}--not_in_creative_inventory=0}

        
    })
end