require 'rails_helper'

RSpec.describe "movies/new", type: :view do
  before(:each) do
    assign(:movie, Movie.new(
      name: "MyString",
      desc: "MyText",
      year: 1,
      actor: nil,
      director: nil,
      city: nil
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input[name=?]", "movie[name]"

      assert_select "textarea[name=?]", "movie[desc]"

      assert_select "input[name=?]", "movie[year]"

      assert_select "input[name=?]", "movie[actor_id]"

      assert_select "input[name=?]", "movie[director_id]"

      assert_select "input[name=?]", "movie[city_id]"
    end
  end
end
