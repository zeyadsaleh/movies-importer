require 'rails_helper'

RSpec.describe "reviews/new", type: :view do
  before(:each) do
    assign(:review, Review.new(
      comment: "MyString",
      rate: 1,
      user: nil,
      movie: nil
    ))
  end

  it "renders new review form" do
    render

    assert_select "form[action=?][method=?]", reviews_path, "post" do

      assert_select "input[name=?]", "review[comment]"

      assert_select "input[name=?]", "review[rate]"

      assert_select "input[name=?]", "review[user_id]"

      assert_select "input[name=?]", "review[movie_id]"
    end
  end
end
