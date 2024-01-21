local setCode = ""
local randomSetCode = ""
local setName = ""
local packCount = 0
local randomPacks = false
local magicBack = "http://cloud-3.steamusercontent.com/ugc/1044218919659567154/72AEBC61B3958199DE4389B0A934D68CE53D030B/"
local smallSetsNoBasics = {["CON"]="ALA", ["ARB"]="ALA", ["WWK"]="ZEN", ["GTC"]="RTR", ["BNG"]="THS", ["JOU"]="THS", ["AER"]="KLD"}
local oldSets = {"LEA", "LEB", "2ED", "3ED", "4ED", "5ED", "6ED", "ICE", "MIR", "VIS", "WTH", "TMP", "STH", "EXO", "USG", "ULG", "UDS", "MMQ", "NEM", "PCY", "INV", "PLS", "APC", "ODY", "TOR", "JUD", "ONS", "LGN", "SCG", "MRD", "DST", "5DN", "CHK", "BOK", "SOK", "RAV", "GPT", "DIS", "CSP", "LRW", "MOR", "SHM", "EVE"}
local oldCoreSets = {"7ED", "8ED", "UNH", "9ED", "10E"}
local normalSets = {"M10", "M11", "M12", "M13", "M14", "M15", "ORI", "M21", "ALA", "CON", "ARB", "ZEN", "WWK", "ROE", "SOM", "MBS", "NPH", "AVR", "RTR", "GTC", "THS", "BNG", "JOU", "KTK", "DTK", "BFZ", "KLD", "AER", "AKH", "HOU", "XLN", "RIX", "ELD", "THB"}
local newNormalSets = {"AFR", "SNC", "ONE"}
local setNameMapping = {["LEA"]="Alpha (Limited Edition)", ["LEB"]="Beta (Limited Edition)", ["2ED"]="Unlimited Edition", ["ARN"]="Arabian Nights", ["ATQ"]="Antiquities", ["3ED"]="Revised Edition", ["LEG"]="Legends", ["DRK"]="The Dark", ["FEM"]="Fallen Empires", ["4ED"]="Fourth Edition", ["ICE"]="Ice Age", ["CHR"]="Chronicles", ["HML"]="Homelands", ["ALL"]="Alliances", ["MIR"]="Mirage", ["VIS"]="Visions", ["5ED"]="Fifth Edition", ["POR"]="Portal", ["WTH"]="Weatherlight", ["TMP"]="Tempest", ["STH"]="Stronghold", ["EXO"]="Exodus", ["P02"]="Portal Second Age", ["UGL"]="Unglued", ["USG"]="Urza's Saga", ["ULG"]="Urza's Legacy", ["6ED"]="Sixth Edition", ["PTK"]="Portal Three Kingdoms", ["UDS"]="Urza's Destiny", ["S99"]="Starter 1999", ["MMQ"]="Mercadian Masques", ["NEM"]="Nemesis", ["PCY"]="Prophecy", ["INV"]="Invasion", ["PLS"]="Planeshift", ["7ED"]="Seventh Edition", ["APC"]="Apocalypse", ["ODY"]="Odyssey", ["TOR"]="Torment", ["JUD"]="Judgment", ["ONS"]="Onslaught", ["LGN"]="Legions", ["SCG"]="Scourge", ["8ED"]="Eighth Edition", ["MRD"]="Mirrodin", ["DST"]="Darksteel", ["5DN"]="Fifth Dawn", ["CHK"]="Champions of Kamigawa", ["UNH"]="Unhinged", ["BOK"]="Betrayers of Kamigawa", ["SOK"]="Saviors of Kamigawa", ["9ED"]="Ninth Edition", ["RAV"]="Ravnica: City of Guilds", ["GPT"]="Guildpact", ["DIS"]="Dissension", ["CSP"]="Coldsnap", ["TSP"]="Time Spiral", ["PLC"]="Planar Chaos", ["FUT"]="Future Sight", ["10E"]="Tenth Edition", ["LRW"]="Lorwyn", ["MOR"]="Morningtide", ["SHM"]="Shadowmoor", ["EVE"]="Eventide", ["ALA"]="Shards of Alara", ["CON"]="Conflux", ["ARB"]="Alara Reborn", ["M10"]="Magic 2010", ["ZEN"]="Zendikar", ["WWK"]="Worldwake", ["ROE"]="Rise of the Eldrazi", ["M11"]="Magic 2011", ["SOM"]="Scars of Mirrodin", ["MBS"]="Mirrodin Besieged", ["NPH"]="New Phyrexia", ["M12"]="Magic 2012", ["ISD"]="Innistrad", ["DKA"]="Dark Ascension", ["AVR"]="Avacyn Restored", ["M13"]="Magic 2013", ["RTR"]="Return to Ravnica", ["GTC"]="Gatecrash", ["DGM"]="Dragon's Maze", ["MMA"]="Modern Masters", ["M14"]="Magic 2014", ["THS"]="Theros", ["BNG"]="Born of the Gods", ["JOU"]="Journey into Nyx", ["CNS"]="Conspiracy", ["M15"]="Magic 2015", ["KTK"]="Khans of Tarkir", ["FRF"]="Fate Reforged", ["DTK"]="Dragons of Tarkir", ["MM2"]="Modern Masters 2015", ["ORI"]="Magic Origins", ["BFZ"]="Battle for Zendikar", ["OGW"]="Oath of the Gatewatch", ["SOI"]="Shadows over Innistrad", ["EMA"]="Eternal Masters", ["EMN"]="Eldritch Moon", ["CN2"]="Conspiracy: Take the Crown", ["KLD"]="Kaladesh", ["AER"]="Aether Revolt", ["MM3"]="Modern Masters 2017", ["AKH"]="Amonkhet", ["HOU"]="Hour of Devastation", ["XLN"]="Ixalan", ["IMA"]="Iconic Masters", ["UST"]="Unstable", ["RIX"]="Rivals of Ixalan", ["A25"]="Masters 25", ["DOM"]="Dominaria", ["BBD"]="Battlebond", ["M19"]="Core Set 2019", ["GRN"]="Guilds of Ravnica", ["UMA"]="Ultimate Masters", ["RNA"]="Ravnica Allegiance", ["WAR"]="War of the Spark", ["MH1"]="Modern Horizons", ["M20"]="Core Set 2020", ["ELD"]="Throne of Eldraine", ["MB1"]="Mystery Booster", ["THB"]="Theros Beyond Death", ["IKO"]="Ikoria: Lair of Behemoths", ["M21"]="Core Set 2021", ["JMP"]="Jumpstart", ["2XM"]="Double Masters", ["ZNR"]="Zendikar Rising", ["CMR"]="Commander Legends", ["KHM"]="Kaldheim", ["TSR"]="Time Spiral Remastered", ["STX"]="Strixhaven: School of Mages", ["MH2"]="Modern Horizons 2", ["AFR"]="Dungeons & Dragons: Adventures in the Forgotten Realms", ["MID"]="Innistrad: Midnight Hunt", ["VOW"]="Innistrad: Crimson Vow", ["NEO"]="Kamigawa: Neon Dynasty"}
local funkySets = {
    ['ARN']='6_r:c|2_r>c',
    ['ATQ']='6_r:c|2_r>c',
    ['LEG']='11_r:c|3_r:u|1_r:r', --uncommons technically either A or B pool
    ['DRK']='6_r:c|2_r>c',
    ['FEM']='6_r:c|2_r>c',
    ['CHR']='9_r:c|3_r>c',
    ['HML']='6_r:c|2_2/3_r:u_r:r',
    ['ALL']='8_r:c|3_r:u|1_r:r',
    ['POR']='9_r:c|3_r:u|1_r:r|2_basics',
    ['P02']='9_r:c|3_r:u|1_r:r|2_basics',
    ['PTK']='5_r:c|2_r:u|1_r:r|2_basics',
    ['S99']='9_r:c|3_r:u|1_r:r|2_basics',
    ['UGL']='6_r:c|2_r:u|1_r:r|1_basics',
    ['MMA']='10_r:c|3_r:u|1_1/8_r:r_r:m|1_ ',
    ['MM2']='10_r:c|3_r:u|1_1/8_r:r_r:m|1_ ',
    ['EMA']='10_r:c|3_r:u|1_1/8_r:r_r:m|1_ ',
    ['MM3']='10_r:c|3_r:u|1_1/8_r:r_r:m|1_ ',
    ['IMA']='10_r:c|3_r:u|1_1/8_r:r_r:m|1_ ',
    ['A25']='10_r:c|3_r:u|1_1/8_r:r_r:m|1_ ',
    ['UMA']='10_r:c|3_r:u|1_1/8_r:r_r:m|1_ ',
    ['2XM']='8_r:c|3_r:u|2_1/8_r:r_r:m|2_ ',
    ['2X2']='1_noset !"Cryptic Spires"|2_ |2_10/74_r:r_r:m|3_r:u|8_r:c',
    ['TSR']='10_r:c|3_r:u|1_1/8_r:r_r:m|1_r:s',
    ['M19']='10_r:c -t:land|3_r:u|1_1/8_r:r_r:m|1_5/12_basics_t:land r:c',
    ['M20']='10_r:c -t:land|3_r:u|1_1/8_r:r_r:m|1_5/12_basics_t:land r:c',
    ['DGM']='recursive 1_10/242_DGM-1_DGM-2',
    ['DGM-1']='10_r:c -t:land|3_r:u|1_1/8_r:r_r:m -t:land|1_t:land',
    ['DGM-2']='10_r:c -t:land|3_r:u|1_1/8_r:r_r:m -t:land|1_noset is:booster (s:rtr or s:gtc) is:shockland',
    ['FRF']='10_r:c -t:land|3_r:u -t:land|1_1/8_r:r -t:land_r:m -t:land|1_t:land',
    ['GRN']='10_r:c -t:gate|3_r:u -t:gate|1_1/8_r:r -t:gate_r:m -t:gate|1_t:gate',
    ['RNA']='10_r:c -t:gate|3_r:u -t:gate|1_1/8_r:r -t:gate_r:m -t:gate|1_t:gate',
    ['IKO']='10_r:c -(t:land o:life)|3_r:u|1_1/8_r:r_r:m|1_5/12_basics_t:land o:life',
    ['KHM']='10_r:c -t:basic -(t:snow id:m)|3_r:u|1_1/8_r:r_r:m|1_5/12_t:land t:snow t:basic_t:land t:snow id:m',
    ['MH1']='10_r:c -(t:basic t:snow)|3_r:u|1_1/8_r:r_r:m|1_t:basic t:snow',
    ['MH2']='10_r:c|3_r:u -is:reprint|1_10/74_r:r (-is:reprint or is:fetchland)_r:m -is:reprint|1_is:reprint -is:fetchland',
    ['ISD']='9_r:c -is:dfc|3_r:u -is:dfc|1_1/8_r:r -is:dfc_r:m -is:dfc|1_is:dfc|1_basics',
    ['DKA']='9_r:c -is:dfc|3_r:u -is:dfc|1_1/8_r:r -is:dfc_r:m -is:dfc|1_is:dfc|1_otherbasic s:isd',
    ['OGW']='10_2/70_r:c -!Wastes_!Wastes|3_r:u|1_1/8_r:r_r:m|1_otherbasic s:bfz',
    ['SOI']='8_r:c -is:dfc|3_r:u -is:dfc|1_1/8_r:r -is:dfc_r:m -is:dfc|1_is:dfc r<r|1_1/8_r:c_is:dfc r>u|1_basics',
    ['EMN']='8_r:c -is:dfc|3_r:u -is:dfc|1_1/8_r:r -is:dfc_r:m -is:dfc|1_is:dfc r<r|1_1/8_r:c_is:dfc r>u|1_otherbasic s:soi', --meld cards have normal backs
    ['TSP']='10_r:c|3_r:u|1_r:r|1_noset is:booster s:tsb',
    ['PLC']='8_r:c -frame:colorshifted|3_r:c frame:colorshifted|2_r:u -frame:colorshifted|1_1/4_r:u frame:colorshifted_r:r frame:colorshifted|1_r:r -frame:colorshifted',
    ['FUT']='11_r:c|3_r:u|1_r:r', --any might be timeshifted. Maro:"5-10???"
    ['STX']='10_r:c|3_r:u|1_10/74_r:r_r:m|1_noset s:sta',
    ['UST']='8_r:c -t:contraption|3_r:u -t:contraption|1_1/8_r:r -t:contraption_r:m -t:contraption|1_t:contraption|1_r<r t:contraption|1_1/121_basics_!"Steamflogger Boss"', --contraption ratios are an approximation
    ['CNS']='10_r:c -o:draft -t:conspiracy|3_r:u -o:draft -t:conspiracy|1_1/8_r:r -o:draft -t:conspiracy_r:m -o:draft -t:conspiracy|1_(o:draft or t:conspiracy)', --draft/conspiracy slot rarity distribution unknown
    ['CN2']='10_r:c -t:conspiracy|3_r:u -t:conspiracy|1_1/8_r:r -t:conspiracy_r:m -t:conspiracy|1_t:conspiracy', --conspiracy slot rarity distribution unknown
    ['CMR']='12_r:c|1_1/6_r:c_!"The Prismatic Piper"|3_r:u|2_t:legendary t:creature|1_(r:r or r:m) -is:commander|1_ ',
    ['MB1']='2_r<r c=w|2_r<r c=u|2_r<r c=b|2_r<r c=r|2_r<r c=g|1_r<r c=m|1_r<r (t:artifact or t:land)|1_-frame:2015|1_r>u frame:2015|1_noset s:cmb1',
    ['DOM']='recursive 1_1/4_DOM-1_DOM-2', --assuming all 4 u/r/m slots equally likely replacement
    ['DOM-1']='10_r:c|2_r:u|1_1/8_r:r_r:m|1_r:u t:legendary t:creature|1_basics',
    ['DOM-2']='10_r:c|3_r:u|1_1/8_r:r t:legendary t:creature_r:m t:legendary t:creature|1_basics',
    ['WAR']='recursive 1_1/4_WAR-1_WAR-2', --assuming all 4 u/r/m slots equally likely replacement
    ['WAR-1']='10_r:c|2_r:u -t:planeswalker|1_1/8_r:r -t:planeswalker_r:m -t:planeswalker|1_r:u t:planeswalker|1_basics',
    ['WAR-2']='10_r:c|3_r:u -t:planeswalker|1_1/8_r:r t:planeswalker_r:m t:planeswalker|1_basics',
    ['ZNR']='recursive 1_1/4_ZNR-1_ZNR-2', --assuming all 4 u/r/m slots equally likely replacement
    ['ZNR-1']='10_r:c|2_r:u -is:mdfc|1_10/74_r:r -is:mdfc_r:m -is:mdfc|1_r:u is:mdfc|1_basics',
    ['ZNR-2']='10_r:c|3_r:u -is:mdfc|1_10/74_r:r is:mdfc_r:m is:mdfc|1_basics',
    ['MID']='recursive 1_1/4_MID-1_MID-2', --assuming all 4 u/r/m slots equally likely replacement
    ['MID-1']='9_r:c -is:dfc|1_r:c is:dfc|2_r:u -is:dfc|1_r:u is:dfc|1_10/74_r:r_r:m|1_basics',
    ['MID-2']='9_r:c -is:dfc|1_r:c is:dfc|2_r:u -is:dfc|1_r:u|1_10/74_r:r is:dfc_r:m is:dfc|1_basics',
    ['VOW']='recursive 1_1/4_VOW-1_VOW-2', --assuming all 4 u/r/m slots equally likely replacement
    ['VOW-1']='9_r:c -is:dfc|1_r:c is:dfc|2_r:u -is:dfc|1_r:u is:dfc|1_10/74_r:r_r:m|1_basics',
    ['VOW-2']='9_r:c -is:dfc|1_r:c is:dfc|2_r:u -is:dfc|1_r:u|1_10/74_r:r is:dfc_r:m is:dfc|1_basics',
    ['DBL']='recursive 1_3/7_DBL-MID-c_DBL-MID-urm|1_3/7_DBL-VOW-c_DBL-VOW-urm|1_DBL-Foil', --assuming all slots equally likely replacement
    ['DBL-MID-c']='3_in:mid r:c -is:dfc|1_in:mid r:c is:dfc|2_in:mid r:u -is:dfc|1_10/74_in:mid r:r -is:dfc_in:mid r:m -is:dfc',
    ['DBL-MID-urm']='recursive 1_1/3_DBL-MID-u_DBL-MID-rm',
    ['DBL-MID-u']='4_in:mid r:c -is:dfc|1_in:mid r:u -is:dfc|1_in:mid r:u is:dfc|1_10/74_in:mid r:r -is:dfc_in:mid r:m -is:dfc',
    ['DBL-MID-rm']='4_in:mid r:c -is:dfc|2_in:mid r:u -is:dfc|1_10/74_in:mid r:r is:dfc_in:mid r:m is:dfc',
    ['DBL-VOW-c']='3_in:vow -in:mid r:c -is:dfc|1_in:vow -in:mid r:c is:dfc|2_in:vow -in:mid r:u -is:dfc|1_10/74_in:vow -in:mid r:r -is:dfc_in:vow -in:mid r:m -is:dfc',
    ['DBL-VOW-urm']='recursive 1_1/3_DBL-VOW-u_DBL-VOW-rm',
    ['DBL-VOW-u']='4_in:vow -in:mid r:c -is:dfc|1_in:vow -in:mid r:u -is:dfc|1_in:vow -in:mid r:u is:dfc|1_10/74_in:vow -in:mid r:r -is:dfc_in:vow -in:mid r:m -is:dfc',
    ['DBL-VOW-rm']='4_in:vow -in:mid r:c -is:dfc|2_in:vow -in:mid r:u -is:dfc|1_10/74_in:vow -in:mid r:r is:dfc_in:vow -in:mid r:m is:dfc',
    ['DBL-Foil']='1_ ',
    ['CLB']='recursive 1_31/100_CLB-CU_CLB-RM',
    ['CLB-CU']='13_r:c -t:background|3_r:u -t:background|1_t:legendary (t:creature or t:planeswalker) r<r|1_1/12_t:background r<r_t:background r:r|1_10/74_-t:legendary r:r_-t:legendary r:m|1_ ',
    ['CLB-RM']='13_r:c -t:background|3_r:u -t:background|1_10/74_t:legendary (t:creature or t:planeswalker) r:r_t:legendary (t:creature or t:planeswalker) r:m|1_1/12_t:background r<r_t:background r:r|1_10/74_-t:legendary r:r_-t:legendary r:m|1_ ',
    ['DMU']='recursive 1_1/4_DMU-1_DMU-2', --assuming all 4 u/r/m slots equally likely replacement
    ['DMU-1']='10_r:c|2_r:u -t:legendary|1_10/74_r:r_r:m|1_r:u t:legendary t:creature|1_basics',
    ['DMU-2']='10_r:c|3_r:u -t:legendary|1_10/74_r:r t:legendary t:creature_r:m t:legendary t:creature|1_basics',
    ['BRO']='recursive 1_1/3_BRO-U_BRO-RM',
    ['BRO-U']='10_r:c|3_r:u|1_10/74_r:r_r:m|1_noset s:brr r:u',
    ['BRO-RM']='recursive 1_7/34_BRO-R_BRO-M',
    ['BRO-R']='10_r:c|3_r:u|1_10/74_r:r_r:m|1_noset s:brr r:r',
    ['BRO-M']='10_r:c|3_r:u|1_10/74_r:r_r:m|1_noset s:brr r:m',
    ['MOM']='recursive 1_1/3_MOM-normal_MOM-dfc',  --assuming all 3 slots equally likely for r/m
    ['MOM-dfc']='recursive 1_1/2_MOM-dfcnormal_MOM-battle',
    ['MOM-normal']='8_r:c -t:land -is:dfc|2_r:u -t:battle -is:dfc|1_is:dfc -t:battle r<r|1_10/74_-is:dfc r:r_-is:dfc r:m|1_t:battle is:dfc r<r|1_noset s:MUL|1_1/2_basics_t:land id=m',
    ['MOM-dfcnormal']='8_r:c -t:land -is:dfc|2_r:u -t:battle -is:dfc|1_10/74_is:dfc -t:battle r:r_is:dfc -t:battle r:m|1_-is:dfc r:u|1_t:battle is:dfc r<r|1_noset s:MUL|1_1/2_basics_t:land id=m',
    ['MOM-battle']='8_r:c -t:land -is:dfc|2_r:u -t:battle -is:dfc|1_is:dfc -t:battle r<r|1_-is:dfc r:u|1_10/74_t:battle is:dfc r:r_t:battle is:dfc r:m|1_noset s:MUL|1_1/2_basics_t:land id=m',
    ['NEO']='9_r:c -(t:land o:life) -is:dfc|3_r:u -is:dfc|1_r<r is:dfc|1_10/74_r:r_r:m|1_5/12_basics_t:land o:life',
    ['DMR']='10_r:c|3_r:u|1_10/74_r:r_r:m|1_otherbasic s:dmr' --basics weren't spawning correctly
}

local retryCount = {}
local packContents = {}
local relatedRetryCount = 0
local maxRetries = 20
local retryWaitFrames = 60
local delayFrames = 6

function onLoad()
    math.randomseed(os.time())
    math.random(); math.random(); math.random()
end

function trim(s)
   return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function starts_with(str, start)
   return str:sub(1, #start) == start
end

function urlencode (str)
    str = string.gsub (
        str,
        "([^0-9a-zA-Z !'()*._~-])",
        function (c) return string.format ("%%%02X", string.byte(c)) end
    )
    str = string.gsub (str, " ", "+")
    return str
end

function urldecode (str)
    str = string.gsub (str, "+", " ")
    str = string.gsub (str, "%%(%x%x)", function(h) return string.char(tonumber(h,16)) end)
    return str
end

function tableContains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end

function createCard(name, cardFace, cardBack, player, deckIndex, slotIndex)
    local customCardData = {
        face = cardFace,
        back = cardBack
    }

    local playerSeat = player.getHandTransform()
    local shiftForward = 1
    if deckIndex >= 0 then
        shiftForward = 1 + math.floor(deckIndex / 3)
    end
    local shiftRight = deckIndex
    if deckIndex >=0 then
        shiftRight = deckIndex % 3
    end
    local spawnData = {
        type = "CardCustom",
        position = playerSeat.position + (playerSeat.forward * 5 * shiftForward) + (playerSeat.right * 4 * shiftRight) + (playerSeat.up * .5 * slotIndex),
        rotation = vector(playerSeat.rotation.x, (playerSeat.rotation.y + 180) % 360, playerSeat.rotation.z+180),
        scale = vector(1.5, 1, 1.5)
    }
    if deckIndex < 0 then
        spawnData["position"] = self.getPosition() + (playerSeat.up * 2)
    end


    local newCard = spawnObject(spawnData)
    newCard.setName(name)
    newCard.setCustomObject(customCardData)

end

function input_change(_, _, userInput, stillEditing, setCode)
    if stillEditing == false then
        setCode = userInput
    end
end

function setCodeInput(obj, color, input, stillEditing)
    if not stillEditing then
        setCode = string.upper(input)
    end
end

self.createInput({
    input_function="setCodeInput", function_owner=self, tooltip="Set Code",
    alignment=3, position={-0.25,.5,-.25}, height=125, width=200,
    font_size=64, validation=4, label="Set", value=setCode
})

function packCountInput(obj, color, input, stillEditing)
    if not stillEditing then
        packCount = input
    end
end

self.createInput({
    input_function="packCountInput", function_owner=self, tooltip="Pack Count",
    alignment=3, position={0.25,.5,-.25}, height=125, width=200,
    font_size=78, validation=2, label="Packs", value=packCount
})

self.createButton({
    click_function = "submit",
    function_owner = self,
    label          = "Submit",
    position       = {0, .5, .25},
    rotation       = {0, 0, 0},
    width          = 400,
    height         = 200,
    font_size      = 78,
    color          = {0, .5, 0},
    font_color     = {1, 1, 1},
    tooltip        = "Generate pack",
})

function getRarities(set)
    if(tableContains(oldSets, set)) then
        return "11_3_1_0_0"
    elseif(tableContains(oldCoreSets, set)) then
        return "10_3_1_0_0"
    elseif(tableContains(normalSets, set)) then
        return "10_3_1_1_8"
    elseif(tableContains(newNormalSets, set)) then
        return "10_3_1_10_74"
    else
        if funkySets[set] == nil then
            printToAll("Set not accounted for: "..set..". Defaulting to 10/3/1", {r=255, g=255, b=255})
        end
        return "10_3_1_1_8"
    end
end

function generateRandomSet(packIndex, color)
    local allSets = {}
    for _,set in ipairs(oldSets) do
        table.insert(allSets, set)
    end
    for _,set in ipairs(oldCoreSets) do
        table.insert(allSets, set)
    end
    for _,set in ipairs(normalSets) do
        table.insert(allSets, set)
    end
    for _,set in ipairs(newNormalSets) do
        table.insert(allSets, set)
    end
    for set,instruction in pairs(funkySets) do
        if #set == 3 then
            table.insert(allSets, set)
        end
    end
    local i = math.random(1, #allSets)
    printToAll(Player[color].steam_name.."'s pack #"..packIndex..": "..setNameMapping[allSets[i]], {r=255, g=255, b=255})
    return allSets[i]
end

function submit(obj, color, alt_click)
    if setCode == "" then
        randomPacks = true
    else
        randomPacks = false
    end
    relatedRetryCount = 0
    for i=1, packCount do
        packContents[i] = {}
        local set = setCode
        retryCount[i] = 0
        if randomPacks then
            set = generateRandomSet(i, color)
        end
        if funkySets[set] ~= nil then
            createFunkyPack(color, set, i)
        else
            createPack(color, set, i)
        end
    end
end

function createPack(color, set, packIndex)
    local url = "https://api.scryfall.com/cards/random?q=e"..urlencode(":")
    url = url..set
    url = url..urlencode(" is:booster lang:english game:paper")
    local raritiesString = getRarities(set)
    local raritiesFunction = raritiesString:gmatch("([^_]+)")
    local rarities = {raritiesFunction(), raritiesFunction(), raritiesFunction(), raritiesFunction(), raritiesFunction()}
    local commons = tonumber(rarities[1])
    local uncommons = tonumber(rarities[2])
    local rareMythics = tonumber(rarities[3])
    local mythicChance = tonumber(rarities[4])
    local mythicTotal = tonumber(rarities[5])
    for i=1, commons do
        Wait.frames(
            function()
                WebRequest.get(url..urlencode(" -t:basic r:c"), function(data) parseCardData(data, color, packIndex, 1, url..urlencode(" -t:basic r:c"), false) end)
            end,
            delayFrames
        )
    end
    for i=1, uncommons do
        Wait.frames(
            function()
                WebRequest.get(url..urlencode(" -t:basic r:u"), function(data) parseCardData(data, color, packIndex, commons, url..urlencode(" -t:basic r:u"), false) end)
            end,
            delayFrames
        )
    end
    for i=1, rareMythics do
        Wait.frames(
            function()
                local rng = math.random(1, mythicTotal)
                if mythicTotal > 0 and rng <= mythicChance then
                    WebRequest.get(url..urlencode(" -t:basic r:m"), function(data) parseCardData(data, color, packIndex, commons+uncommons, url..urlencode(" -t:basic r:m"), false) end)
                else
                    WebRequest.get(url..urlencode(" -t:basic r:r"), function(data) parseCardData(data, color, packIndex, commons+uncommons, url..urlencode(" -t:basic r:r"), false) end)
                end
            end,
            delayFrames
        )
    end
    if smallSetsNoBasics[set] == nil then
       Wait.frames(
            function()
                WebRequest.get(url..urlencode(" (!Plains or !Island or !Swamp or !Mountain or !Forest)"), function(data) parseCardData(data, color, packIndex, 20, url..urlencode(" (!Plains or !Island or !Swamp or !Mountain or !Forest)"), false) end)
            end,
            delayFrames
        )
    elseif smallSetsNoBasics[set] ~= "nil" then
        local landURL = "https://api.scryfall.com/cards/random?q=e"..urlencode(":")
        landURL = landURL..smallSetsNoBasics[set]
        landURL = landURL..urlencode(" is:booster lang:english game:paper")
        Wait.frames(
            function()
                WebRequest.get(landURL..urlencode(" (!Plains or !Island or !Swamp or !Mountain or !Forest)"), function(data) parseCardData(data, color, packIndex, 20, landURL..urlencode(" (!Plains or !Island or !Swamp or !Mountain or !Forest)"), false) end)
            end,
            delayFrames
        )
    end
end

function parseCardData(data, color, packIndex, slotIndex, url, foil)
    local status, err = pcall(function () JSON.decode(data.text) end)
    if not status then
        retryCount[packIndex] = retryCount[packIndex] + 1
        if retryCount[packIndex] <= maxRetries then
            Wait.frames(
                function()
                    Wait.frames(
                        function()
                            WebRequest.get(url, function(data) parseCardData(data, color, packIndex, slotIndex, url, foil) end)
                        end,
                        delayFrames
                    )
                end,
                retryWaitFrames
            )
            return
        else
            printToAll("ran out of retries: pack "..packIndex, {r=255, g=255, b=255})
            return
        end
    end
    local cardData = JSON.decode(data.text)
    local name = cardData["name"]
    if (not foil) and (packContents[packIndex][name] ~= nil) then
        Wait.frames(
            function()
                Wait.frames(
                    function()
                        WebRequest.get(url..urlencode(' -!"'..name..'"'), function(data) parseCardData(data, color, packIndex, slotIndex, url..urlencode(' -!"'..name..'"'), foil) end)
                    end,
                    delayFrames
                )
            end,
            retryWaitFrames
        )
        return
    end
    local cardFront
    if cardData["card_faces"] ~= nil and #cardData["card_faces"] > 1 and cardData["card_faces"][1]["image_uris"] ~= nil then
        cardFront = cardData["card_faces"][1]["image_uris"]["normal"]
        local cardBack = cardData["card_faces"][2]["image_uris"]["normal"]
        createCard(name, cardFront, cardBack, Player[color], packIndex-1, slotIndex)
        createCard(name, cardFront, magicBack, Player[color], -2, 1)
        packContents[packIndex][name] = 1
    else
        if cardData["image_uris"] == nil then
            printToAll("Can't find images for card. Decoded url: "..urldecode(url), {r=255, g=255, b=255})
            for key,value in pairs(cardData) do
                printToAll(key..": "..value, {r=255, g=255, b=255})
            end
        else
            cardFront = cardData["image_uris"]["normal"]
            createCard(name, cardFront, magicBack, Player[color], packIndex-1, slotIndex)
            packContents[packIndex][name] = 1
        end
    end
    
    --get related cards
    if cardData["all_parts"] then
        for _,part in ipairs(cardData["all_parts"]) do
            if part["component"] == "token" or part["component"] == "meld_result" then
                Wait.frames(
                    function()
                        WebRequest.get(part["uri"], function(data) parseRelatedCardData(data, color, part["uri"]) end)
                    end,
                    delayFrames
                )
            elseif part["component"] == "combo_piece" and string.find(part["type_line"], "Emblem", 1, true) then
                Wait.frames(
                    function()
                        WebRequest.get(part["uri"], function(data) parseRelatedCardData(data, color, part["uri"]) end)
                    end,
                    delayFrames
                )
            end
        end
    end
end

function parseRelatedCardData(data, color, url)
    local status, err = pcall(function () JSON.decode(data.text) end)
    local back = magicBack
    if not status then
        relatedRetryCount = relatedRetryCount + 1
        if relatedRetryCount <= maxRetries then
            Wait.frames(
                function()
                    Wait.frames(
                        function()
                            WebRequest.get(url, function(data) parseRelatedCardData(data, color, url) end)
                        end,
                        delayFrames
                    )
                end,
                retryWaitFrames
            )
            return
        else
            printToAll("ran out of related card retries: "..url, {r=255, g=255, b=255})
            return
        end
    end
    local cardData = JSON.decode(data.text)
    local name = cardData["name"]
    local cardFront
    if cardData["layout"] == "transform" or cardData["layout"] == "modal_dfc" then
        cardFront = cardData["card_faces"][1]["image_uris"]["normal"]
    elseif cardData["layout"] == "double_faced_token" then
        cardFront = cardData["card_faces"][1]["image_uris"]["normal"]
        back = cardData["card_faces"][2]["image_uris"]["normal"]
    else
        cardFront = cardData["image_uris"]["normal"]
    end
    createCard(name, cardFront, back, Player[color], -2, 1)
end

function createFunkyPack(color, set, packIndex)
    local instructions = funkySets[set]
    set = set:sub(1, 3)
    local recursive = false
    if starts_with(instructions, "recursive") then
        recursive = true
        instructions = instructions:sub(#"recursive"+1, #instructions)     
    end
    local url = "https://api.scryfall.com/cards/random?q="..urlencode("e:"..set.." (is:booster lang:english game:paper -t:token -t:plane -t:scheme -t:phenomenon -t:dungeon -t:vanguard -!Plains -!Island -!Swamp -!Mountain -!Forest) ")
    local counts = {}
    local index = 0
    for cardType in instructions:gmatch("([^|]+)") do
        index = index + 1
        local splitFunction = cardType:gmatch("([^_]+)")
        local split = {splitFunction(), splitFunction(), splitFunction(), splitFunction()}
        local count = split[1]
        counts[index] = count
        local slotIndex = 1
        if counts[index-1] ~= nil then
            slotIndex = 0
            for i=1,index-1 do
                slotIndex = slotIndex + counts[i]
            end
        end
        if split[3] ~= nil then
            local oddsFunction = split[2]:gmatch("([^/]+)")
            local odds1 = oddsFunction()
            local odds2 = oddsFunction()
            local q1 = split[3]
            local q2 = split[4]
            for i=1, tonumber(count) do
                if recursive then
                    local rng = math.random(1, tonumber(odds2))
                    if rng <= tonumber(odds1) then
                        createFunkyPack(color, q2, packIndex)
                    elseif q1 ~= "nil" then
                        createFunkyPack(color, q1, packIndex)
                    end
                else
                    Wait.frames(
                        function()
                            local rng = math.random(1, tonumber(odds2))
                            local newURL = url
                            local newQ1 = q1
                            local newQ2 = q2
                            if rng <= tonumber(odds1) then
                                if starts_with(q2, "noset") then
                                    newQ2 = newQ2:sub(#"noset"+1, #newQ2)
                                    newURL = "https://api.scryfall.com/cards/random?q="..urlencode("(lang:english game:paper -t:token -t:plane -t:scheme -t:phenomenon -t:dungeon -t:vanguard -!Plains -!Island -!Swamp -!Mountain -!Forest) ")
                                elseif starts_with(q2, "otherbasic") then
                                    newQ2 = newQ2:sub(#"otherbasic"+1, #newQ2).." (!Plains or !Island or !Swamp or !Mountain or !Forest)"
                                    newURL = "https://api.scryfall.com/cards/random?q="..urlencode("(lang:english game:paper -t:token -t:plane -t:scheme -t:phenomenon -t:dungeon -t:vanguard) ")
                                end
                                if newQ2 == "basics" then
                                    newURL = "https://api.scryfall.com/cards/random?q="..urlencode("e:"..set.." (is:booster lang:english game:paper) ")
                                    newQ2 = "(!Plains or !Island or !Swamp or !Mountain or !Forest)"
                                end
                                WebRequest.get(newURL..urlencode(newQ2), function(data) parseCardData(data, color, packIndex, slotIndex, newURL..urlencode(newQ2), trim(newQ2) == "") end)
                            elseif newQ1 ~= "nil" then
                                if starts_with(q1, "noset") then
                                    newQ1 = newQ1:sub(#"noset"+1, #newQ1)
                                    newURL = "https://api.scryfall.com/cards/random?q="..urlencode("(lang:english game:paper -t:token -t:plane -t:scheme -t:phenomenon -t:dungeon -t:vanguard -!Plains -!Island -!Swamp -!Mountain -!Forest) ")
                                elseif starts_with(q1, "otherbasic") then
                                    newQ1 = newQ1:sub(#"otherbasic"+1, #newQ1).." (!Plains or !Island or !Swamp or !Mountain or !Forest)"
                                    newURL = "https://api.scryfall.com/cards/random?q="..urlencode("(lang:english game:paper -t:token -t:plane -t:scheme -t:phenomenon -t:dungeon -t:vanguard) ")
                                end
                                if newQ1 == "basics" then
                                    newURL = "https://api.scryfall.com/cards/random?q="..urlencode("e:"..set.." (is:booster lang:english game:paper) ")
                                    newQ1 = "(!Plains or !Island or !Swamp or !Mountain or !Forest)"
                                end
                                WebRequest.get(newURL..urlencode(newQ1), function(data) parseCardData(data, color, packIndex, slotIndex, newURL..urlencode(newQ1), trim(newQ1) == "") end)
                            end
                        end,
                        delayFrames
                    )
                end
            end
        else
            local query = split[2]
            for i=1, tonumber(count) do
                if recursive then
                    createFunkyPack(color, query, packIndex)
                else
                    Wait.frames(
                        function()
                            local newURL = url
                            local newQuery = query
                            if starts_with(newQuery, "noset") then
                                newQuery = newQuery:sub(#"noset"+1, #newQuery)
                                newURL = "https://api.scryfall.com/cards/random?q="..urlencode("(lang:english game:paper -t:token -t:plane -t:scheme -t:phenomenon -t:dungeon -t:vanguard -!Plains -!Island -!Swamp -!Mountain -!Forest) ")
                            elseif starts_with(newQuery, "otherbasic") then
                                newQuery = newQuery:sub(#"otherbasic"+1, #newQuery).." (!Plains or !Island or !Swamp or !Mountain or !Forest)"
                                newURL = "https://api.scryfall.com/cards/random?q="..urlencode("(lang:english game:paper -t:token -t:plane -t:scheme -t:phenomenon -t:dungeon -t:vanguard) ")
                            end
                            if newQuery == "basics" then
                                newURL = "https://api.scryfall.com/cards/random?q="..urlencode("e:"..set.." (is:booster lang:english game:paper) ")
                                newQuery = "(!Plains or !Island or !Swamp or !Mountain or !Forest)"
                            end
                            WebRequest.get(newURL..urlencode(newQuery), function(data) parseCardData(data, color, packIndex, slotIndex, newURL..urlencode(newQuery), trim(newQuery) == "") end)
                        end,
                        delayFrames
                    )
                end
            end
        end
    end
end