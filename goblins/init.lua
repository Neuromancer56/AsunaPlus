local path = minetest.get_modpath("goblins")
local settings = minetest.settings

-- set namespace for goblins functions
goblins = {}
goblins.db = minetest.get_mod_storage()
goblins.db:set_string("goblins mod start time", os.date())

goblins.version = 20221029
local mobs_req = 20220903

local S = minetest.get_translator("goblins")

-- Strips any kind of escape codes (translation, colors) from a string
-- https://github.com/minetest/minetest/blob/53dd7819277c53954d1298dfffa5287c306db8d0/src/util/string.cpp#L777
function goblins.strip_escapes(input)
    local s = function(idx) return input:sub(idx, idx) end
    local out = ""
    local i = 1
    while i <= #input do
        if s(i) == "\027" then -- escape sequence
            i = i + 1
            if s(i) == "(" then -- enclosed
                i = i + 1
                while i <= #input and s(i) ~= ")" do
                    if s(i) == "\\" then
                        i = i + 2
                    else
                        i = i + 1
                    end
                end
            end
        else
            out = out .. s(i)
        end
        i = i + 1
    end
    -- print(("%q -> %q"):format(input, out))
    return out
end

local function print_s(input) print(goblins.strip_escapes(input)) end
if minetest.get_modpath("mcl_mobs") and minetest.get_modpath("mcl_core") then
    print(S("Goblins say: Smells like MineClone Game!"))
    dofile(path .. "/mc2_compat.lua")
else
    dofile(path .. "/mtg_compat.lua")
    if mobs.version then
        if tonumber(mobs.version) >= tonumber(mobs_req) then
            print(S("Mobs Redo @1 or greater found!", mobs_req))
        else
            print(S("You should find a more recent version of Mobs Redo!"))
            print(S("https://notabug.org/TenPlus1/mobs_redo"))
        end
    else
        print(S("This mod requires Mobs Redo version 2020516 or greater!"))
        print(S("https://notabug.org/TenPlus1/mobs_redo"))
    end
end

function goblins.mr(min, max)
    local v = 1
    if max and max < min then
        print("WARNING: max (" .. max .. ") is less than min (" .. min ..
                  ") for math.random!\n Substituting with value of 1!")
        return v
    end
    if min then
        if max then
            v = math.random(min, max)
        else
            v = math.random(min)
        end
    end
    return v
end

function goblins.debug(input, debug_category)
    debug_category = debug_category or ""
    local setting_debug = settings:get_bool("goblins_debug", false)
    local setting_debug_category = settings:get("goblins_debug_category")

    if setting_debug then
        if setting_debug_category then

            local filters = {}
            string.gsub(setting_debug_category, "(%a+)",
                        function(w) table.insert(filters, w) end)

            for i, v in ipairs(filters) do
                if string.find(debug_category, v) then
                    print_s(debug_category .. " " .. input)
                end
            end
        else
            print_s(debug_category .. " " .. input)
        end
    end
end

local goblins_version = goblins.version
-- create the table if it does not exist!

goblins.db_fields = goblins.db:to_table()["fields"]

function goblins.db_deser(table)
    local data = minetest.deserialize(goblins.db_fields[table])
    return data
end

function goblins.db_read(table)
    local data = minetest.deserialize(goblins.db:to_table()["fields"][table])
    return data
end

function goblins.db_write(key, table)
    local data = minetest.serialize(table)
    goblins.db:set_string(key, data)
    return key, data
end

if not goblins.db_fields["territories"] then
    print("-------------\nWe must Initialize!\n-------------")
    goblins.db_write("territories", {
        test = {
            version = goblins_version,
            encode = minetest.encode_base64(os.date()),
            created = os.date()
        }
    })
end

if not goblins.db_fields["relations"] then
    print("-------------\nWe must Initialize!\n-------------")
    goblins.db_write("relations", {
        test = {
            version = goblins_version,
            encode = minetest.encode_base64(os.date()),
            created = os.date()
        }
    })
end

-- compatability with minimal game
    minetest.LIGHT_MAX = minetest.LIGHT_MAX or 14



minetest.log("action", "[MOD] goblins " .. goblins.version .. " is lowdings....")
print_s(S(
            "Please report issues at https://gitlab.com/freelikegnu/goblins/-/issues "))

dofile(path .. "/content.lua")
dofile(path .. "/utilities.lua")
dofile(path .. "/traps.lua")
dofile(path .. "/nodes.lua")
dofile(path .. "/items.lua")
dofile(path .. "/soundsets.lua")
dofile(path .. "/behaviors.lua")
dofile(path .. "/goblins_spawning.lua")
dofile(path .. "/animals.lua")
dofile(path .. "/goblins.lua")
dofile(path .. "/hunger.lua")
dofile(path .. "/goblins_custom.lua") -- allow for additional/replacement goblins created by user
dofile(path .. "/hud.lua")
-------------
-- ASSEMBLE THE GOBLIN HORDES!!!!
-------------

local gob_types = goblins.gob_types
local gobdog_types = goblins.gobdog_types
local goblin_template = goblins.goblin_template
local gobdog_template = goblins.gobdog_template
local gob_name_parts = goblins.gob_name_parts
local gob_words = goblins.words_desc
local rules = {}

goblins.generate(gob_types, goblin_template)
goblins.generate(gobdog_types, gobdog_template)

local function ggn(...) return goblins.generate_name(...) end

print([[          _   _ _ 
  ___ ___| |_| |_|___ ___ 
 | . | . | . | | |   |_ -|
 |_  |___|___|_|_|_|_|___|
 |___|  
]])

print_s(S(
            "This diversion is dedicated to the memory of @1 the @2, @3 the @4, and @5 the @6... May their hordes be mine!",
            ggn(gob_name_parts), ggn(gob_words, {"tool_adj"}),
            ggn(gob_name_parts), ggn(gob_words, {"tool_adj"}),
            ggn(gob_name_parts), ggn(gob_words, {"tool_adj"})))
print_s(S("   --@1 of the @2 clan.", ggn(gob_name_parts),
          ggn(gob_name_parts, {"list_a", "list_opt", "-", "list_b"})))

