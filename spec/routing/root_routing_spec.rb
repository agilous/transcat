# frozen_string_literal: true

require 'rails_helper'

describe 'root routing' do
  it 'routes to categories#index' do
    expect(get: '/').to route_to('categories#index')
  end
end
