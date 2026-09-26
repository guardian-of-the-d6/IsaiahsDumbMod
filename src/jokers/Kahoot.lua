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
        }
    },
    loc_vars = function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator + G.GAME.dollars)
        return{            
            vars = {
                numerator,
                denominator,
            }
        }
    end,
    calculate = function(self, card, context)
        if  context.individual and context.cardarea == G.hand and  SMODS.pseudorandom_probability(card, "Kahoot", card.ability.extra.numerator,card.ability.extra.denominator) and card.ability.extra.active then
            return{
                xmult = context.other_card:get_id()
            }
        end

    end
}