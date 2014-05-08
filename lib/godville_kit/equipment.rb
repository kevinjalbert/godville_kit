module GodvilleKit
  class Equipment
    attr_reader :weapon,
                :shield,
                :head,
                :body,
                :arms,
                :legs,
                :tailsman

    def initialize(raw_equipment_data)
      @weapon = GodvilleKit::Gear.new(raw_equipment_data['weapon'])
      @shield = GodvilleKit::Gear.new(raw_equipment_data['shield'])
      @head = GodvilleKit::Gear.new(raw_equipment_data['head'])
      @body = GodvilleKit::Gear.new(raw_equipment_data['body'])
      @arms = GodvilleKit::Gear.new(raw_equipment_data['arms'])
      @legs = GodvilleKit::Gear.new(raw_equipment_data['legs'])
      @talisman = GodvilleKit::Gear.new(raw_equipment_data['talisman'])
    end
  end
end
