

SMODS.Consumable {
    key = "signalum",
    atlas = "consumables1",
    pos = {x = 0, y = 0},

    set = 'isaiah_scryer',
    hidden = true,
    soul_set = 'Tarot',
    soul_rate = 0.03,
    weight = 5,
    use = function(self, card, area, copier)
        local card = create_card("Joker", G.jokers, nil, "isaiah_mythic", nil, nil, nil, "")
		card:add_to_deck()
		card:start_materialize()
		G.jokers:emplace(card)
        return true
        
    end,
    can_use = function(self, card)
        return #G.jokers.cards < G.jokers.config.card_limit
    end
}