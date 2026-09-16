local fossil = SMODS.load_file("src/fossilisation/fossilise.lua")()

SMODS.Joker {
    key  = "opabinia",
    atlas = "sprites2",
    pos = {
        x = 4,
        y = 0
    },
    rarity = 1,
    cost = 5,
    config = {
        extra = {
            mult = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return{
                mult = card.ability.extra.mult
            }
        end
        if context.individual and SMODS.has_enhancement(context.other_card, 'm_stone') then
            if context.cardarea == G.play then
                card.ability.extra.mult = card.abilility.extra.mult + 2    
            end
            if context.cardarea == G.hand then
                return{fossil.fossilise(card)}
            end
        end
    end
}