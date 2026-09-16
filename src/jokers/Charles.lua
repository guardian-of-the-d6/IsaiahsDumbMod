SMODS.Joker{
    key = "charles",
    atlas = 'sprites2',
    pos = {
        x = 1,
        y = 1
    },
    rarity = 4,
    cost= 10,
    config = {
        extra = {
        }
    },
    loc_vars = function(self, info_queue, card)
        return{vars = {#G.GAME.fossilisations + 1}}
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = #G.GAME.fossilisations + 1
            }
        end
    end
}