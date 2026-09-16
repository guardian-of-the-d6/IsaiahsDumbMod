local fossil = SMODS.load_file("src/fossilisation/fossilise.lua")()

SMODS.Joker{
    key = "velociraptormongoliensis",
    atlas = "sprites2",
    pos = {
        x=0, 
        y=2
    },

    rarity = 2,
    cost = 5,
    config = {
        extra = {
            xchips = 1
        }
    },
    loc_vars = function(self, info_queue, card)    
        return {
            vars = {
                card.ability.extra.xchips
            }
        }
    
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 then
                card.ability.extra.xchips = card.ability.extra.xchips + 0.1
            end
        end
        if context.cardarea == G.hand and context.individual and SMODS.has_enhancement(context.other_card, 'm_stone') then
            return{fossil.fossilise(card)}
        end
    
    if context.joker_main then
        return {
            xchips = card.ability.extra.xchips
        }
    end
end
    

}