require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  let(:movie) {
    Movie.create!(
      name: "MyString",
      desc: "MyText",
      year: 1,
      actor: nil,
      director: nil,
      city: nil
    )
  }

  before(:each) do
    assign(:movie, movie)
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(movie), "post" do

      assert_select "input[name=?]", "movie[name]"

      assert_select "textarea[name=?]", "movie[desc]"

      assert_select "input[name=?]", "movie[year]"

      assert_select "input[name=?]", "movie[actor_id]"

      assert_select "input[name=?]", "movie[director_id]"

      assert_select "input[name=?]", "movie[city_id]"
    end
  end
end
