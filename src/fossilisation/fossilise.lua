local fossil = {}

function fossil.fossilise(card)
        G.GAME.fossilisations[#G.GAME.fossilisations+1] = card
        SMODS.destroy_cards(card, nil, nil, false)
        return{
        message = "Fossilised!",
        colour = G.C.RED
    }
end

return fossil