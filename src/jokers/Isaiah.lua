local fossil = SMODS.load_file("src/fossilisation/fossilise.lua")()

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
    if context.end_of_round then
            for i, joker in ipairs(G.jokers.cards) do
                if G.jokers.cards[i].ability.name == "Drunkard" then
                    fossil.fossilise(card)
                    return{
                        message = "Alcohol",
                        colour = G.C.YELLOW
                    }
                end
            end
        end
    end
}
