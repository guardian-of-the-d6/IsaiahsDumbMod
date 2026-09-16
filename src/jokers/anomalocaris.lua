local fossil = SMODS.load_file("src/fossilisation/fossilise.lua")()

SMODS.Joker{
    key = "anomalocaris",
    atlas = "sprites2",
    pos = {x=2,y=0},
    rarity = 2,
    cost = 3,
    config = {
        extra = {
            xmult = 1,
            scaling = 0.1
            }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xmult,
            }
        }
    end,
    calculate = function (self, card, context)
        if context.ante_end then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra, -- the table that has the value you are changing in
                ref_value = "xmult", -- the key to the value in the ref_table
                scalar_value = "scaling", -- the key to the value to scale by, in the ref_table by default
            })
        end
        if context.cardarea == G.play and context.individual then
            if context.other_card:is_face() then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
            
        end
            if context.cardarea == G.hand and context.individual and SMODS.has_enhancement(context.other_card, 'm_stone') then
                return{fossil.fossilise(card)}
            end
    end
}