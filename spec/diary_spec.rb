require 'diary'

RSpec.describe Diary do
    context "initially" do
        it "has an empty list" do
            diary = Diary.new
            expect(diary.all).to eq[]
        end

        it "has a word count 0" do
            diary = Diary.new
            expect(diary.count_words).to eq 0
    end
end