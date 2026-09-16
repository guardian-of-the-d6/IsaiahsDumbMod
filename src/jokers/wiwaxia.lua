local fossil = SMODS.load_file("src/fossilisation/fossilise.lua")()
SMODS.Joker {
    key = "wiwaxia",
    atlas =  "sprites2",
    pos = {
        x = 0,
        y = 1
    },
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            mult = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return{
                mult = card.ability.extra.mult,
            }
        end
        if context.cardarea == G.hand and context.individual and SMODS.has_enhancement(context.other_card, 'm_stone') then
            return{fossil.fossilise(card)}
        end
    end
}