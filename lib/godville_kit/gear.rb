class GodvilleKit::Gear
  attr_reader :name,
              :level

  def initialize(raw_gear_data)
    @name = raw_gear_data['name'].to_s
    @level = raw_gear_data['level'].to_s
  end
end
