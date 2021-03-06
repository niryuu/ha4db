# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'components/edit', type: :view do
  before(:each) do
    bridge = FactoryBot.create(:bridge)
    @component = assign(:component, FactoryBot.create(:component, bridge: bridge))
  end

  it 'renders the edit component form' do
    render

    assert_select 'form[action=?][method=?]', component_path(@component), 'post' do
    end
  end
end
