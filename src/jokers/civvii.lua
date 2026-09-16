SMODS.Joker{
    key = "civvii",
    atlas = "placeholders",
    pos = {
        x=3,
        y=2
    },
    rarity = 3,
    cost = 7,
    config = {
        extra ={
            xmult = 1,
            ante = 0
        }
    },
    loc_vars = function(self, info_queue, card)
       return{
        vars = {
            card.ability.extra.xmult,
            card.ability.extra.ante
        }
       } 
    end,
    calculate = function(self, card, context)
        if context.ante_change and card.ability.extra.ante > 0 then
            card.ability.extra.ante = card.ability.extra.ante + 1
        end
        if context.ante_change and card.ability.extra.ante > 4 then
            card.ability.extra.ante =  -1
            card.ability.extra.xmult = 25
        end
    end

}