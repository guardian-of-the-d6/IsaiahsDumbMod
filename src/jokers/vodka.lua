SMODS.Joker{
    key = "vodka",
    atlas = "placeholders",
    pos = {
        x= 0, 
        y = 2
    },
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            mult = 20,
            chips = -10
        }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips
            }
        }
    end,
    calculate= function(self, card, context)
        if context.joker_main and next(context.poker_hands["High Card"]) then
            return{
            mult = card.ability.extra.mult,
            chips = card.ability.extra.chips
            }
        end
        if context.end_of_round then
            for i, joker in ipairs(G.jokers.cards) do
                if G.jokers.cards[i].ability.name == "Drunkard" then
                    SMODS.destroy_cards(card, nil, nil, false)
                    return{
                        message = "Alcohol",
                        colour = G.C.YELLOW
                    }
                end
            end
        end
    end

}