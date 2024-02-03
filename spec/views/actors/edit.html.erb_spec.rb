require 'rails_helper'

RSpec.describe "actors/edit", type: :view do
  let(:actor) {
    Actor.create!(
      name: "MyString"
    )
  }

  before(:each) do
    assign(:actor, actor)
  end

  it "renders the edit actor form" do
    render

    assert_select "form[action=?][method=?]", actor_path(actor), "post" do

      assert_select "input[name=?]", "actor[name]"
    end
  end
end
