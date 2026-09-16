SMODS.Joker{
    key='sixseven',
    atlas = 'placeholders',
    pos = {x=4,y=0},
    config = {
        extra={
            xchips = 6,
            xmult = 7
        }
    },
    rarity = "isaiah_mythic",
    cost = 67,
    blueprint_compat=true,
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xchips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and (context.other_card:get_id()==6 or context.other_card:get_id()==7) then
            return {xchips = card.ability.extra.xchips,
                    xmult = card.ability.extra.xmult}
        end
    end
}