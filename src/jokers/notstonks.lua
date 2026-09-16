SMODS.Joker{
    key="notstonks",
    atlas="placeholders",
    pos={x=2,y=1},
    rarity = 2,
    cost = 10,
    config = {
        extra ={
            mult = 0
        }
    },
    loc_vars = function(self, info_queue, card)
            return{
                card.ability.extra.dollars,
                card.ability.extra.mult
            }
        end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id() ==2 then
            G.GAME.dollars = G.GAME.dollars - context.other_card:get_id()
            card.ability.extra.mult = card.ability.extra.mult + 2
            return{
                mult = card.ability.extra.mult
            }
        end
    end
}