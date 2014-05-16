module GodvilleKit
  class Hero
    attr_reader :name,
                :god_name,
                :level,
                :quest,
                :quest_progress,
                :exp_progress,
                :health,
                :max_health,
                :alignment,
                :motto,
                :guild,
                :guild_rank,
                :ark,
                :temple_completed_at,
                :ark_completed_at,
                :town,
                :next_town,
                :distance,
                :bricks,
                :wood,
                :god_power,
                :gold,
                :monsters_killed,
                :deaths,
                :arena_wins,
                :arena_losses,
                :approximate_age,
                :birthday,
                :accumulator,
                :quests_completed,
                :monster_name,
                :monster_progress,
                :aura_name,
                :aura_time,
                :max_inventory,
                :inventory,
                :pantheons,
                :equipment,
                :skills,
                :diary,
                :important_events,
                :pet

    def initialize(raw_hero_data, raw_pantheons_data)
      if raw_hero_data
        @name = raw_hero_data['hero']['name'].to_s
        @god_name = raw_hero_data['hero']['godname'].to_s
        @level = raw_hero_data['hero']['level'].to_s
        @quest = raw_hero_data['hero']['quest'].to_s
        @quest_progress = raw_hero_data['hero']['quest_progress'].to_s
        @exp_progress = raw_hero_data['hero']['exp_progress'].to_s
        @health = raw_hero_data['hero']['health'].to_s
        @max_health = raw_hero_data['hero']['max_health'].to_s
        @alignment = raw_hero_data['hero']['alignment'].to_s
        @motto = raw_hero_data['hero']['motto'].to_s
        @guild = raw_hero_data['hero']['clan'].to_s
        @guild_rank = raw_hero_data['hero']['clan_position'].to_s
        @temple_completed_at = raw_hero_data['hero']['temple_completed_at'].to_s
        @ark_completed_at = raw_hero_data['hero']['ark_completed_at'].to_s
        @town = raw_hero_data['hero']['town_name'].to_s
        @next_town = raw_hero_data['hero']['c_town'].to_s
        @distance = raw_hero_data['hero']['distance'].to_s
        @bricks = raw_hero_data['hero']['bricks_cnt'].to_s
        @wood = raw_hero_data['hero']['wood'].to_s
        @god_power = raw_hero_data['hero']['godpower'].to_s
        @gold = raw_hero_data['hero']['gold'].to_s
        @monsters_killed = raw_hero_data['hero']['monsters_killed'].to_s
        @deaths = raw_hero_data['hero']['death_count'].to_s
        @arena_wins = raw_hero_data['hero']['arena_won'].to_s
        @arena_losses = raw_hero_data['hero']['arena_lost'].to_s
        @approximate_age = raw_hero_data['hero']['age_str'].to_s
        @birthday = raw_hero_data['hero']['birthday'].to_s
        @accumulator = raw_hero_data['hero']['accumulator'].to_s
        @quests_completed = raw_hero_data['hero']['quests_completed'].to_s
        @monster_name = raw_hero_data['hero']['monster_name'].to_s
        @monster_progress = raw_hero_data['hero']['monster_progress'].to_s
        @aura_name = raw_hero_data['hero']['aura_name'].to_s
        @aura_time = raw_hero_data['hero']['aura_time'].to_s
        @max_inventory = raw_hero_data['hero']['inventory_max_num'].to_s

        # Inventory
        @inventory = raw_hero_data['inventory'].keys.map do |key|
          GodvilleKit::Item.new(key, raw_hero_data['inventory'][key].to_s)
        end

        # Equipment
        @equipment = GodvilleKit::Equipment.new(raw_hero_data['equipment'])

        # Skils
        @skills = raw_hero_data['skills'].map do |raw_skill_data|
          GodvilleKit::Skill.new(raw_skill_data)
        end

        # Diary
        @diary = raw_hero_data['diary'].map do |raw_diary_entry_data|
          GodvilleKit::DiaryEntry.new(raw_diary_entry_data)
        end

        # Important Events
        @important_events = raw_hero_data['imp_e'].map do |raw_important_events_entry_data|
          GodvilleKit::DiaryEntry.new(raw_important_events_entry_data)
        end

        # Pet
        @pet = GodvilleKit::Pet.new(raw_hero_data['pet'])
      end

      # Pantheons
      if raw_pantheons_data
        @pantheons = GodvilleKit::Pantheons.new(raw_pantheons_data)
      end
    end
  end
end
