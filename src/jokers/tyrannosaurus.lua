local fossil = SMODS.load_file("src/fossilisation/fossilise.lua")()

SMODS.Joker {
    key = "tyrannosaurusrex",
    atlas = "sprites2",
    pos = {
        x = 1, 
        y = 2
    },
    rarity = "isaiah_mythic",
    cost = 40,
    config = {
        extra = {
            xmult = 1,
            scaling = 1.5
        }
    },
        loc_vars = function(self, info_queue, card)    
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.scaling
            }
        }
    
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 13 then
                SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult", 
                scalar_value = "scaling", 
            })
            return {
                message = "Upgrade!",
                colour = G.C.RED
            }
            end
        end
        if context.cardarea == G.hand and context.individual and SMODS.has_enhancement(context.other_card, 'm_stone') then
            return{fossil.fossilise(card)}
        end
    
    if context.joker_main then
        return {
            xmult = card.ability.extra.xmult
        }
    end
end


}