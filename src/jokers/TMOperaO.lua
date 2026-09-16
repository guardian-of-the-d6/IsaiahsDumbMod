SMODS.Joker{
    key = "tmoperao",
    atlas = "placeholders",
    pos = {
        x=1,
        y=2
    },
    rarity = 3,
    cost = 7,
    config = {
        extra = {
            mult = 10,
            chips = 10,
            money = 10
        }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
                card.ability.extra.money
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands["Five of a Kind"]) then
            card.ability.extra.mult = card.ability.extra.mult + context.scoring_hand[1]:get_id()
            return{
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
                dollars = card.ability.extra.money
            }     
        end
    end
}