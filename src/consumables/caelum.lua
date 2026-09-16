local fossil = SMODS.load_file("src/fossilisation/fossilise.lua")()

SMODS.Consumable {
    key = "caelum",
    atlas = "consumables1",
    pos = {x = 3, y = 0},
    set = 'isaiah_scryer',
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
            }
        }
    end,
    use = function(self, card, area, copier)
        numOfJokers = #G.jokers.cards
        for i=1,numOfJokers,1 do
            fossil.fossilise(G.jokers.cards[i])
            local card = create_card("Joker", G.jokers, nil, 3, nil, nil, nil, "")
            card:start_materialize()
            card:add_to_deck()
            G.jokers:emplace(card)
        end
    return true 
end,
    can_use = function(self, card)
        return #G.jokers.cards >= 1
    end
}