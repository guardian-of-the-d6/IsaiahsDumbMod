SMODS.Joker{
    key = "chickenjoker",
    atlas = "placeholders",
    pos = {
        x = 2,
        y= 2
    },
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            mult = 50,
            chips = 5
        }
    },
    loc_vars =  function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        
        if context.before and next(context.poker_hands["Two Pair"]) then
            temp = card.ability.extra.mult
            card.ability.extra.mult = card.ability.extra.chips
            card.ability.extra.chips = temp
            return{
                message = "CHICKEN JOCKEY!!!",
                colour = G.C.RED
            }
        end
        if context.joker_main and next(context.poker_hands["Pair"]) then
            return{
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
                
            }
        end

    end
}