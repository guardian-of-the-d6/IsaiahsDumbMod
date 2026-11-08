SMODS.Joker{
    key = "arthropleuraarmata",
    atlas = "sprites3",
    pos = {
        x = 0,
        y = 1
    },
    rarity = 4,
    cost = 50,
    config = {
        extra = {
            xmult = 1,
            scaling = 0.1,
            copy = true
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.copy,
            }
        }
    end,
    calculate = function(self, card, context)
        if context.skip_blind  then
            SMODS.scale_card(card, {
                ref_table = card.ability.extra,
                ref_value = "xmult", 
                scalar_value = "scaling", 
            })
            if #G.jokers.cards < G.jokers.config.card_limit  and card.ability.extra.copy == true then
                card.ability.extra.copy = false
                local card_copied = copy_card(card, nil, nil, nil, card.edition and card.edition.negative)
                card_copied:start_materialize()
                card_copied:add_to_deck()
                G.jokers:emplace(card_copied)
                card.ability.extra.copy = true
            end
        end
        if context.joker_main then
            return{
                xmult = card.ability.extra.xmult
            }
        end
        if context.cardarea == G.hand and context.individual and SMODS.has_enhancement(context.other_card, 'm_stone') then
            return{fossil.fossilise(card)}
        end
    end

}