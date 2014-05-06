class GodvilleKit::DiaryEntry
  attr_reader :message,
              :time

  def initialize(raw_diary_entry_data)
    @message = raw_diary_entry_data['msg'].to_s
    @time = raw_diary_entry_data['time'].to_s
  end
end
