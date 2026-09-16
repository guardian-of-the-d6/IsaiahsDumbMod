SMODS.Joker{
    key = "lemon",
    atlas = "placeholders",
    pos=  {
        x = 0,
        y = 3
    },
    rarity = "isaiah_mythic",
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
                repetitions = context.other_card:get_id()
            }
        end
    end
}