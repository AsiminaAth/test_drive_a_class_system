require 'diary_entry'

RSpec.describe DiaryEntry do
    it "constructs" do
        diary_entry = DiaryEntry.new("my title", "my contents")
        expect(diary_entry.title).to eq "my title"
        expect(diary_entry.contents).to eq "my contents"
    end

    describe "count_words method" do
        it "returns 0 if contents is empty" do
            diary_entry = DiaryEntry.new("my title", "")
            expect(diary_entry.count_words).to eq 0
        end

        it "counts the words" do
            diary_entry = DiaryEntry.new("my title", "four words making four")
            expect(diary_entry.count_words).to eq 4
        end
    end

    describe "reading time method" do
        it "returns 0 if contents is empty" do
            diary_entry = DiaryEntry.new("my title", "")
            expect(diary_entry.reading_time(2)).to eq 0
        end

        it "returns a reading time for all the contents" do
            diary_entry = DiaryEntry.new("my title", "four words making four")
            expect(diary_entry.reading_time(2)).to eq 3
        end
        
        it "fails if the reading time is 0" do
            diary_entry = DiaryEntry.new("my title", "my contents")
            expect{diary_entry.reading_time(0)}.to raise_error "The reading time cannot be 0."
        end
end
