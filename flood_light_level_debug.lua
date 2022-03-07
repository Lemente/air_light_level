--/!\USE WITH CAUTION/!\
--light nodes that will fill any space below a ceiling
for i=1,14 do
    minetest.register_node(":flood_light_level:" .. i, {
        description = "Air node that emits light and floods internal spaces: light level " .. i,
--[[
        drawtype = "airlike",
]]--        
        drawtype = 'nodebox',
        tiles = {"head.png"},
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