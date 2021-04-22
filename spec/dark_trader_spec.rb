require_relative "../lib/dark_trader"

describe "the scrapping method" do
    it "should return final_data, and final_data is not nil" do
        expect(scrapping).not_to be_nil
    end
end