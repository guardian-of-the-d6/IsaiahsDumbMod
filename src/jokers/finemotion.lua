SMODS.Joker{
    key = "finemotion",
    atlas = "placeholders",
    pos = {
        x = 4, 
        y = 2
    },
    rarity = 3,
    cost = 3,

    config = {
        extra = {
            mult = 14,
            xchips = 1.5,
            numerator = 15,
            denominator = 31
        }
    },
    loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator)
        return{
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                numb,
                denom
            }
        }
    end,
    calculate = function(self, context, card)
        if context.money_altered and SMODS.pseudorandom_probability(card, "motion",card.ability.extra.numerator,card.ability.extra.denominator) then
            return{
                mult = card.ability.extra.mult,
                xchips = card.ability.extra.xchips
            }
        end
    end
}