module GodvilleKit
  class DiaryEntry
    attr_reader :message,
                :time,
                :voice,
                :voice_id,
                :voice_name

    def initialize(raw_diary_entry_data)
      @message = raw_diary_entry_data['msg'].to_s
      @time = raw_diary_entry_data['time'].to_s
      @voice = raw_diary_entry_data['voice'].to_s
      @voice_id = raw_diary_entry_data['voice_id'].to_s
      @voice_name = raw_diary_entry_data['voice_name'].to_s
    end
  end
end
