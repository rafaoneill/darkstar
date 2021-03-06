-----------------------------------------
-- Spell: Protectra
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local power = 15;
    local duration = 1800;

    duration = calculateDurationForLvl(duration, 7, target:getMainLvl());

    local typeEffect = dsp.effect.PROTECT;
    if (target:addStatusEffect(typeEffect, power, 0, duration)) then
        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT);
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT); -- no effect
    end

    return typeEffect;
end;
