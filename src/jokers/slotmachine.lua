SMODS.Joker{
    key = "slotmachine",
    atlas = "sprites2",
    pos = {
        x = 4,
        y= 2
    },
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            numerator = 1,
            denominator = 48,
            xmult = 777,
            xchips = 777
        }
    },
    loc_vars =  function(self, info_queue, card)
        local numerator, denominator = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator + G.GAME.dollars)
        return{            
            vars = {
                numerator,
                denominator,
                xmult,
                xchips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id()==7 and  SMODS.pseudorandom_probability(card, "slots",card.ability.extra.numerator,card.ability.extra.denominator) then
            play_sound("isaiah_letsgogambling",1,0.55)
            return{
                xmult = card.ability.extra.xmult,
                xchips = card.ability.extra.xchips,
                message = "Let's go gambling!!!",
                colour = G.C.GREEN
            }
        end
    end
}
