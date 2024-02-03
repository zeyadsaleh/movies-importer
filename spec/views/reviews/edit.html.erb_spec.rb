require 'rails_helper'

RSpec.describe "reviews/edit", type: :view do
  let(:review) {
    Review.create!(
      comment: "MyString",
      rate: 1,
      user: nil,
      movie: nil
    )
  }

  before(:each) do
    assign(:review, review)
  end

  it "renders the edit review form" do
    render

    assert_select "form[action=?][method=?]", review_path(review), "post" do

      assert_select "input[name=?]", "review[comment]"

      assert_select "input[name=?]", "review[rate]"

      assert_select "input[name=?]", "review[user_id]"

      assert_select "input[name=?]", "review[movie_id]"
    end
  end
end
