SMODS.Joker{
    key = 'frog',
    atlas = 'placeholders',
    pos = {
        x=3,
        y=1
    },
    config = {
        extra = {
            mult = 100
        }
    },
    rarity = 1,
    cost = 3,
    loc_vars = function(self, info_queue, card)
            return{
                vars = {
                    card.ability.extra.mult
                }
            }
        end,

    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['Flush Five']) then
            
            return{
                message = "FROOOOOOOOOOOOG!",
                colour = G.C.YELLOW,
                mult = card.ability.extra.mult
            }
        end
    end

}