SMODS.Joker{
    key='regaljoker',
    atlas = 'placeholders',
    pos = {x=4,y=3},
    config = {
        extra={
            xmult = 3
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
        if context.individual and context.cardarea == G.play and (context.other_card:get_id()==12 or context.other_card:get_id()==13) then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}