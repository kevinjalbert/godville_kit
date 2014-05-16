module GodvilleKit
  class Pet
    attr_reader :name,
                :class,
                :level,
                :is_dead,
                :approximate_age

    def initialize(raw_pet_entry_data)
      @name = raw_pet_entry_data['pet_name'].to_s
      @class = raw_pet_entry_data['pet_class'].to_s
      @level = raw_pet_entry_data['pet_level'].to_s
      @is_dead = raw_pet_entry_data['pet_is_dead'].to_s
      @approximate_age = raw_pet_entry_data['pet_birthday_string'].to_s
    end
  end
end
