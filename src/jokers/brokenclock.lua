SMODS.Joker{
    key = "brokenclock",
    atlas = "sprites2",
    pos = {
        x = 3,
        y= 2
    },
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            numerator = 1,
            denominator = 12
        }
    },
    loc_vars =  function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator + G.GAME.dollars)
        return{            
            vars = {
                numerator,
                denominator
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before and SMODS.pseudorandom_probability(card, "clock",card.ability.extra.numerator,card.ability.extra.denominator) then
            for i, j in pairs(G.GAME.hands) do
                level_up_hand(self, i, true)
            end
            return{
                message = "LEVEL UP!!!!!!!",
                colour = G.C.GREEN
            }
        end
    end
}
