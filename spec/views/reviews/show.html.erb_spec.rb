require 'rails_helper'

RSpec.describe "reviews/show", type: :view do
  before(:each) do
    assign(:review, Review.create!(
      comment: "Comment",
      rate: 2,
      user: nil,
      movie: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Comment/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
