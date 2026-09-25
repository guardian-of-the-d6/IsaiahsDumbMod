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
            xmult = 1.5,
            numerator = 1,
            denominator = 4,
            active = false
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
        if context.before and context.individual and context.cardarea == G.hand and  SMODS.pseudorandom_probability(card, "slots",card.ability.extra.numerator,card.ability.extra.denominator) then
            card.ability.extra.active = true
            return{
                xmult = card.ability.extra.xmult
            }
        end
        if context.joker_main and self.active == false then
            return{
                xmult = card.ability.extra.xmult
            }
        end
        if context.joker_main and self.active == true then
            self.ability.extra.xmult = false
        end
    end
}