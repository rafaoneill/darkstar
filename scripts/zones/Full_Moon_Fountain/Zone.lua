-----------------------------------
--
-- Zone: Full_Moon_Fountain (170)
--
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Full_Moon_Fountain/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/titles");
-----------------------------------

function onInitialize(zone)
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-260.136,2.09,-325.702,188);
    end
    if (player:getCurrentMission(WINDURST) == FULL_MOON_FOUNTAIN and player:getVar("MissionStatus") == 3) then
        cs = 50;
    elseif (player:getCurrentMission(WINDURST) == DOLL_OF_THE_DEAD and player:getVar("MissionStatus") == 7) then
            cs = 61;
    end
    return cs;
end;

function afterZoneIn(player)
    player:entityVisualPacket("kilk");
    player:entityVisualPacket("izum");
    player:entityVisualPacket("hast");
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

    if (csid == 50) then
        finishMissionTimeline(player,3,csid,option);
    elseif (csid == 61) then
        player:addTitle(dsp.title.GUIDING_STAR);
        finishMissionTimeline(player,3,csid,option);
    end
end;
