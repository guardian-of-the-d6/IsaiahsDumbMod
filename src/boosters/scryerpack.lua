SMODS.Booster {
    key = "scryerpack",
    config = {
        choose = 1,
        extra  = 3
    },
    group_key = "k_isaiah_scryerpack",
    weight = 2.25,
    draw_hand = true,
    kind = "ScryerPack",
    cost = 6,
    create_card = function(self, card, i)
        return {
            set = "isaiah_scryer", area = G.consumables, skip_materialize = true, soulable = true, key_append =  'scryerpackgen'
        }
    end,
    loc_vars = function(self, info_queue, card)
        return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
    end
}
SMODS.Booster {
    key = "jumboscryerpack",
    config = {
        choose = 1,
        extra  = 5
    },
    group_key = "k_isaiah_scryerpack",
    weight = 1.25,
    draw_hand = true,
    kind = "ScryerPack",
    cost = 8,
    create_card = function(self, card, i)
        return {
            set = "isaiah_scryer", area = G.consumables, skip_materialize = true, soulable = true, key_append =  'scryerpackgen'
        }
    end,
    loc_vars = function(self, info_queue, card)
        return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
    end
}
SMODS.Booster {
    key = "megascryerpack",
    config = {
        choose = 2,
        extra  = 5
    },
    group_key = "k_isaiah_scryerpack",
    weight = 0.25,
    draw_hand = true,
    kind = "ScryerPack",
    cost = 10,
    create_card = function(self, card, i)
        return {
            set = "isaiah_scryer", area = G.consumables, skip_materialize = true, soulable = true, key_append =  'scryerpackgen'
        }
    end,
    loc_vars = function(self, info_queue, card)
        return {
			vars = {
				card and card.ability.choose or self.config.choose,
				card and card.ability.extra or self.config.extra,
			},
		}
    end
}