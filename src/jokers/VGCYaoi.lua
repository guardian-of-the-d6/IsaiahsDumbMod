SMODS.Joker{
    key = "VGCYaoi",
    atlas = "sprites2",
    pos = {
        x=2,
        y=2,
    },
    rarity = 2,
    cost = 4,
    config = {
        extra = {
            mult = 0
        }
    },
    loc_vars = function(self, info_queue,card)
        return{
            vars = {
                card.ability.extra.mult
            }
        }
    end,
    calculate = function(self, card, context)
        if context.before then
           local numOfKings = 0
           for i,card in ipairs(context.full_hand) do
            if card:get_id() == 13 then
                numOfKings = numOfKings + 1
            end
           end
           if numOfKings > 1 then
            card.ability.extra.mult = card.ability.extra.mult + 4
            return{
                message= "YAOI!",
                colour = G.C.RED
            }
           end
        end
        if context.joker_main then
            return{
                mult = card.ability.extra.mult
            }
        end
    end
}