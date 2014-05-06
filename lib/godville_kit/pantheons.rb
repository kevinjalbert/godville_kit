class GodvilleKit::Pantheons
  attr_reader :gratitude,
              :might,
              :templehood,
              :gladiatorship,
              :storytelling,
              :mastery,
              :construction,
              :taming,
              :survival,
              :savings,
              :creation,
              :destruction,
              :arkeology,
              :unity,
              :popularity,
              :aggressiveness

  def initialize(raw_pantheons_data)
    raw_pantheons_data['groups'].map do |pantheon_groups|
      pantheon_groups['pantheons']
    end.each do |pantheons|
      pantheons.each do |pantheon|
        case pantheon['name'].downcase
        when 'gratitude' then @gratitude = pantheon['position'].to_s
        when 'might' then @might = pantheon['position'].to_s
        when 'templehood' then @templehood = pantheon['position'].to_s
        when 'gladiatorship' then @gladiatorship = pantheon['position'].to_s
        when 'storytelling' then @storytelling = pantheon['position'].to_s
        when 'mastery' then @mastery = pantheon['position'].to_s
        when 'taming' then @taming = pantheon['position'].to_s
        when 'survival' then @survival = pantheon['position'].to_s
        when 'creation' then @creation = pantheon['position'].to_s
        when 'destruction' then @destruction = pantheon['position'].to_s
        when 'arkeology' then @arkeology = pantheon['position'].to_s
        when 'unity' then @unity = pantheon['position'].to_s
        when 'popularity' then @popularity = pantheon['position'].to_s
        when 'aggressiveness' then @aggressiveness = pantheon['position'].to_s
        end
      end
    end
  end
end

