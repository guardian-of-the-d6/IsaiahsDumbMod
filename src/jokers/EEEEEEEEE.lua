SMODS.Joker{
    key='eeeeeeeee',
    atlas = 'placeholders',
    pos = {x=0,y=1},
    config = {
        extra={
            money = 0
        }
    },
    rarity = 2,
    cost = 9,
    blueprint_compat=false,
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.money
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            card.ability.extra.money = card.ability.extra.money + G.GAME.dollars
            ease_dollars(-G.GAME.dollars)
            return{
                mult = card.ability.extra.money
            }
        end
    end
}