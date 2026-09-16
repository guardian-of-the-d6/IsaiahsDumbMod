SMODS.Joker{
    key='isaiah',
    atlas = 'placeholders',
    pos = {x=2,y=0},
    config = {
        extra={
            xchips = 1,
            xmult = 1,
            chipchange = 1,
            multchange = 1
        }
    },
    rarity = "isaiah_mythic",
    cost = 6,
    blueprint_compat=false,
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xchips,
                card.ability.extra.xmult,
                card.ability.extra.chipchange,
                card.ability.extra.multchange
            }
        }
    end,
    calculate = function(self, card, context)
        if context.ante_change  then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra, -- the table that has the value you are changing in
                ref_value = "xchips", -- the key to the value in the ref_table
                scalar_value = "chipchange", -- the key to the value to scale by, in the ref_table by default
            })
            SMODS.scale_card(card, {
                ref_table = card.ability.extra, -- the table that has the value you are changing in
                ref_value = "xmult", -- the key to the value in the ref_table
                scalar_value = "multchange", -- the key to the value to scale by, in the ref_table by default
            })
            return {
                message = "EEEEEEEEEE",
                colour=G.C.RED
            }
        end
        if context.joker_main then
            return{
                xchips =card.ability.extra.xchips,
                xmult = card.ability.extra.xmult,
            }
        end
    end
}