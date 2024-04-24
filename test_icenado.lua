-- Create a new Combat object
local combat = Combat()

-- Set parameters for the combat
combat:setParameter(COMBAT_PARAM_TYPE, COMBAT_ICEDAMAGE) -- Set the type of combat damage to ice
combat:setParameter(COMBAT_PARAM_EFFECT, CONST_ME_ICETORNADO) -- Set the visual effect to ice tornado
combat:setArea(createCombatArea(AREA_CIRCLE6X6)) -- Set the area of effect to a 6x6 circle

-- Define a function to calculate the damage values based on player's level and magic level
function onGetFormulaValues(player, level, magicLevel)
    local min = (level / 5) + (magicLevel * 5.5) + 25 -- Calculate minimum damage
    local max = (level / 5) + (magicLevel * 11) + 50 -- Calculate maximum damage
    return min, max
end

-- Set the callback function for level and magic value calculations
combat:setCallback(CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")

-- Create a new Spell object
local spell = Spell("instant")

-- Define the behavior when the spell is cast
function spell.onCastSpell(creature, variant)
    return combat:execute(creature, variant) -- Execute the combat with the provided creature and variant
end

-- Set various properties of the spell
spell:name("Test Icenado") -- Set the name of the spell
spell:words("exevo nado") -- Set the magic words required to cast the spell
spell:group("attack") -- Set the spell group to "attack"
spell:vocation("druid","sorcerer") -- Set the vocations that can use this spell
spell:id(300) -- Set the spell ID
spell:cooldown(40 * 100) -- Set the cooldown time in milliseconds
spell:groupCooldown(4*100) -- Set the group cooldown time in milliseconds
spell:level(1) -- Set the required level to use the spell
spell:mana(10) -- Set the mana cost of the spell
spell:isSelfTarget(true) -- Set whether the spell targets the caster or not
spell:isPremium(false) -- Set whether the spell is premium
spell:register() -- Register the spell in the game
