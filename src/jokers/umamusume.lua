SMODS.Joker{
    key = "umamusume",
    atlas = "placeholders",
    pos = {
        x = 4,
        y = 1
    },
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            mult = 0,
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
       if context.individual and context.cardarea == G.hand and context.other_card:get_id()==11 then
            card.ability.extra.mult = card.ability.extra.mult + 2
            return{
                message = "Ride!",
                colour = G.C.RED
            }
       end
       if context.individual and context.cardarea == G.play and context.other_card:get_id()==11 then
            local multi = card.ability.extra.mult
            card.ability.extra.mult = 0
            return{
                mult = multi,
                message = "UMAMUSUME?!?!",
                colour = G.C.YELLOW
            }
        end
    end

}