require 'diary'
require 'diary_entry'

RSpec.describe 'Diary integration' do
    context "when entries are added" do
        it "shows the diary entries" do
            diary = Diary.new
            diary_entry_1= DiaryEntry.new("my title 1", "my entries 1")
            diary_entry_2= DiaryEntry.new("my title 2", "my entries 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.all).to eq [diary_entry_1, diary_entry_2]
        end

        describe "count_words method" do 
            it "counts the words in all contents" do
                diary = Diary.new
                diary_entry_1= DiaryEntry.new("my title 1", "my entries 1")
                diary_entry_2= DiaryEntry.new("my title 2", "my entries 2")
                diary.add(diary_entry_1)
                diary.add(diary_entry_2)
                expect(diary.count_words).to eq 5
    end

    describe "reading time" do
        it "fails when reading wpm is 0" do
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title", "my contens 1")
            diary.add(diary_entry_1)
            expect{diary.reading_time(0)}.to raise_error("The reading time cannot be 0.")

        it "calculates the readiong time for all the entries" do 
            diary = Diary.new
            diary_entry_1 = DiaryEntry.new("my title 1", "my contents 1")
            diary_entry_2 = DiaryEntry.new("my title 2", "my contents 2")
            diary.add(diary_entry_1)
            diary.add(diary_entry_2)
            expect(diary.reading_time(2)).to eq 3
        end
    end

    describe "best reading time entry" do
        context "where there is just one entry and it's readable in the time" do
            it "returns that entry" do
                diary = Diary.new
                diary_entry_1 = DiaryEntry.new("my title", "my contents")
                diary.add(diary_entry_1)
                result= diary.find_best_entry_for_reading_time(2, 1)
                expect(result).to eq diary_entry_1
            end
        end
    end
end