SMODS.Joker{
    key = "kahoot",
    atlas = sprites2,
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
                xmult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.hand and context.other_card:get_id()==4 and  SMODS.pseudorandom_probability(card, "slots",card.ability.extra.numerator,card.ability.extra.denominator) then
            self.active = true
            return{
                xmult = self.xmult
            }
        end
        if context.joker_main and self.active == false then
            return{
                xmult = self.xmult
            }
        end
    end
}