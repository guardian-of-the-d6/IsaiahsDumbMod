SMODS.Joker{
    key = "letterofmarque",
    atlas = "placeholders",
    pos = {
        x = 1,
        y=  3
    },
    rarity = "isaiah_mythic",
    cost = 4,
    config = {
        extra = {
            xmult = 1,
            gold = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.gold
            }
        }
    end,
    calculate = function(self, card, context)
        if context.money_altered and context.amount < 0  then
            card.ability.extra.gold = card.ability.extra.gold - context.amount
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.gold * 0.005
            message = "Privateers!"
            colour = G.C.YELLOW
        end
        if context.individual and context.cardarea == G.play and (context.other_card:get_id()==12 or context.other_card:get_id()==13) then
            return {
                xmult = card.ability.extra.xmult,
                message = "Privateers!",
                colour = G.C.RED
            }
        end
    end
}