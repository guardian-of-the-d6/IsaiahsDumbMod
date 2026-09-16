SMODS.Joker{
    key = "piggybank",
    atlas = "placeholders",
    pos = {
        x = 3,
        y = 3
    },
    rarity = 3,
    cost = 8,
    config = {
        extra = {
            money = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.money
            }
        }
    end,
    calculate = function(self, card, context)
        if context.money_altered and context.amount > 1 then
            investment = (context.amount - context.amount%2)/2
            G.GAME.dollars = G.GAME.dollars - investment
            card.ability.extra.money = card.ability.extra.money + investment * 4
            
            return {
                message = "Invested!",
                colour = G.C.YELLOW
            }
        end
        if  context.joker_main and next(context.poker_hands["Four of a Kind"]) then
            G.GAME.dollars = G.GAME.dollars + card.ability.extra.money
            SMODS.destroy_cards(card, nil, nil, false)
            return
            {   
                message = "Cashing In!",
                colour = G.C.YELLOW,
            }
        end
    end

}