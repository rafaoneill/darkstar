-----------------------------------------
-- Spell: Enlight
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)

    return 0;

end;


function onSpellCast(caster,target,spell)
    local effect = dsp.effect.ENLIGHT;
    local magicskill = target:getSkillLevel(dsp.skill.DIVINE_MAGIC);
    local duration = 180;
    if (caster:hasStatusEffect(dsp.effect.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local potency = (magicskill / 8) + 12.5;

    if (target:addStatusEffect(effect,potency,0,duration)) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT);
    end
    return effect;
end;
