SMODS.Joker{
    key = 'stonks',
    atlas = 'placeholders',
    pos = {
        x=1,
        y=1
    },
    config = {
        extra = {
            money = 0
        }
    },
    rarity = 2,
    cost = 4,
    loc_vars = function(self, info_queue, card)
            return{
                vars = {
                    card.ability.extra.money
                }
            }
        end,

    calculate = function(self, card, context)
        if  context.before and next(context.poker_hands["Flush"]) then
            card.ability.extra.money = card.ability.extra.money + 2
            return{
                message = "STONKS!",
                colour = G.C.YELLOW
            }
        end
        if context.joker_main and card.ability.extra.money > 0 then
            G.GAME.dollars = G.GAME.dollars + card.ability.extra.money
            return{
                message = "STONKS!",
                colour = G.C.YELLOW,
            }
        end
    end

}