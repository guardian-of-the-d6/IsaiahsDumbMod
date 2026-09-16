SMODS.Joker{
    key='phalanx',
    atlas = 'placeholders',
    pos = {
        x=1,
        y=0
    },
    config = {
        extra={
            chips = 10
        }
    },
    rarity = 1,
    cost = 6,
    blueprint_compat=true,
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.chips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['Pair']) then
            return {chips = card.ability.extra.chips,
                    swap = true}
        end
    end
}