SMODS.Joker{
    key='isaiah',
    atlas = 'sprites3',
    pos = {x=4,y=0},
    soul_atlas = 'soul1',
    soul_pos = {
        x=4,y=0
    },
    rarity = "isaiah_mythic",
    calculate = function(self, card, context)
        if context.fossilise_joker and #G.jokers.cards < G.jokers.config.card_limit then
            local card = create_card("Joker", G.jokers, nil, 4, nil, nil, nil, "")
            card:start_materialize()
            card:add_to_deck()
            G.jokers:emplace(card)
        end
    end
}
