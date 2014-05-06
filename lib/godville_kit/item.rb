class GodvilleKit::Item
  attr_reader :name,
              :activate_by_use,
              :god_power_required,
              :description,
              :type

  def initialize(name, raw_item_data)
    @name = name

    @activate_by_use = raw_item_data['activate_by_user'].to_s
    @god_power_required = raw_item_data['needs_godpower'].to_s
    @description = raw_item_data['description'].to_s
    @type = raw_item_data['type'].to_s
  end
end
