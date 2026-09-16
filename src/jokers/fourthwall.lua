SMODS.Joker{
    key = "fourthwall",
    atlas = "placeholders",
    pos=  {
        x = 0,
        y = 3
    },
    rarity = 2,
    cost = 5,
    config = {
        extra = {
            chips = 0,
            scaling = 4
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips
            }
        }
    end,

    calculate=  function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:get_id()==4 then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra, -- the table that has the value you are changing in
                ref_value = "chips", -- the key to the value in the ref_table
                scalar_value = "scaling", -- the key to the value to scale by, in the ref_table by default
            })
            return{
                chips = card.ability.extra.chips
            }
        end
    end
}