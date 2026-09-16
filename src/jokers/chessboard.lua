SMODS.Joker{
    key = "chessboard",
    atlas = "sprites2",
    pos = {x = 3, y = 1},
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            xchips = 1.5
        }
    },
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xchips
            }
        }
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and (context.other_card:get_id()==12 or context.other_card:get_id()==13) then
            return{
                xchips = card.ability.extra.xchips,
                message = "En Passant!",
                colour = G.C.RED
            }
        end
    end
}