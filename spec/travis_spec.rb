require "rails_helper"

RSpec.describe "a string" do
  it "is equal to another string of the same value" do
    expect("this string").to eq("this string")
 end
end