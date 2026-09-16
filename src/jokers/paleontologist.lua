local fossil = SMODS.load_file("src/fossilisation/fossilise.lua")()

SMODS.Joker{
    key = "paleontologist",
    atlas = "sprites2",
    pos = {
        x=2, y=1
    },
    rarity = 2,
    cost = 6,
    config = {
        extra ={

        }
    },
    loc_vars  = function(self, info_queue, card)
        return {

        }
    end,
    calculate = function(self, card, context)
        if context.ending_shop then
            local card = create_card("Joker", G.jokers, nil, 2, nil, nil, nil, "")
			card:add_to_deck()
			card:start_materialize()
			G.jokers:emplace(card)
			fossil.fossilise(card)
            return true
        end
    end
}