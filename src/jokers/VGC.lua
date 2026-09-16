SMODS.Joker{
    key='vgc',
    atlas = 'placeholders',
    pos = {x=0,y=0},
    config = {
        extra={
            null
        }
    },
    rarity = 1,
    cost = 3,
    blueprint_compat=true,
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.GAME.dollars < 0 then
                return {mult = -G.GAME.dollars}
            end
        end
    end
}