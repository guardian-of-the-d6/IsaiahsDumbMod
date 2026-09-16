SMODS.Consumable {
    key = "cerebrum",
    atlas = "consumables1",
    pos = {x = 2, y = 0},
    set = 'isaiah_scryer',
    loc_vars = function(self, info_queue, card)
        return{
            vars = {
            }
        }
    end,
    use = function(self, card, area, copier)
        local card = copy_card(G.jokers.cards[1], nil, nil, nil, G.jokers.cards[1].edition and G.jokers.cards[1].edition.negative)
        card:start_materialize()
        card:add_to_deck()
    G.jokers:emplace(card)
    return true 
    end,
 
    can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit
    end
}