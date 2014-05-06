class GodvilleKit::Skill
  attr_reader :name,
              :level,
              :type

  def initialize(raw_skill_data)
    @name = raw_skill_data['name'].to_s
    @level = raw_skill_data['level'].to_s
    @type = raw_skill_data['type'].to_s
  end
end
