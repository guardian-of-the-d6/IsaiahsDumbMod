SMODS.Joker{
    key='anagh',
    atlas = 'sprites3',
    pos = {x=0,y=0},
    soul_atlas = 'soul1',
    soul_pos = {x=0,y=0},
    config = {
        extra={

        }
    },
    rarity = "isaiah_mythic",
    cost = 90,
    blueprint_compat=true,
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                G.GAME.dollars
            }
        }
    end,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.dollars < 0 then
            return {
                xmult = -G.GAME.dollars + 1
            }
        end
    end
}