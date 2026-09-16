SMODS.Joker{
    key = "lime",
    atlas = "sprites2",
    pos=  {
        x = 3,
        y = 0
    },
    rarity = 3,
    cost = 5,
    config = {
        extra = {
            
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {

            }
        }
    end,

    calculate=  function(self, card, context)
        if context.cardarea == G.play and context.repetition then
            return {
                repetitions = 2
            }
        end
    end
}