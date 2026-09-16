SMODS.Joker{
    key="taxcollector",
    atlas = "placeholders",
    pos = {
        x=3,
        y=0
    },
    config={
        extra={
            mult = 0,
            chips = 0,
            numerator = 2,
            denominator = 2
        }
    },
    rarity = 3,
    cost = 8,
        loc_vars = function(self, info_queue, card)
        local num, denom = SMODS.get_probability_vars(card, card.ability.extra.numerator, card.ability.extra.denominator + G.GAME.dollars)
        return{
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                numb,
                denom
            }
        }
    end,
    calculate = function(self, card, context)
        if context.money_altered and context.amount < 0  then
            G.GAME.dollars = G.GAME.dollars + context.amount
            if G.GAME.dollars >= 1 then
            card.ability.extra.mult = card.ability.extra.mult - context.amount
            card.ability.extra.chips = card.ability.extra.chips - context.amount
                return{
                    message = "Taxed!",
                    colour = G.C.RED
                }
            end
            if context.money_altered and SMODS.pseudorandom_probability(card, "audit",card.ability.extra.numerator,card.ability.extra.denominator + G.GAME.dollars) then
                card.ability.extra.mult = 0
                card.ability.extra.chips = 0
                return{
                    message = "Audited!",
                    colour = G.C.YELLOW
                }
            end
        end
        if context.joker_main then
            return{
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips
            }
        end
    
    end

}