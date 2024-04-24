local combat = Combat()
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE)
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO)
combat:setArea(createCombatArea(AREA_CIRCLE6X6))

function onGetFormulaValues(player, level, magicLevel)
    local min = (level / 5) + (magicLevel * 5.5) + 25
    local max = (level / 5) + (magicLevel * 11) + 50
    return -min, -max
end

combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

local spell = Spell("instant")

function spell.onCastSpell(creature, variant)
    return combat:execute(creature, variant)
end

spell:name("Test Icenado")
spell:words("exevo nado")
spell:group("attack")
spell:vocation("druid","sorcerer")
spell:id(300)
spell:cooldown(40 * 100)
spell:groupCooldown(4*100)
spell:level(1)
spell:mana(10)
spell:isSelfTarget(true)
spell:isPremium(false)
spell:register()
