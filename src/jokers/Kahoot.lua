SMODS.Joker{
    key = "kahoot",
    atlas = "sprites2",
    pos = {
        x = 4,
        y = 1
    },
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            numerator = 1,
            denominator = 4,
            active = true
        }
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator + G.GAME.dollars)
        return{            
            vars = {
                numerator,
                denominator,
                card.ability.extra.xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if  context.individual and context.cardarea == G.hand and  SMODS.pseudorandom_probability(card, "kahoot", card.ability.extra.numerator,card.ability.extra.denominator) and card.ability.extra.active then
            card.ability.extra.active = false
            return{
                xmult = context.other_card:get_id()
            }
        end
        if context.joker_main then
            card.ability.extra.active = true
        end

    end
}