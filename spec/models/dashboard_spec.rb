# frozen_string_literal: true

require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Dashboard, type: :model do
  describe 'matrix_item' do
    before do
      @bridge1 = FactoryBot.create(:bridge)
      @bridge2 = FactoryBot.create(:bridge)
      @bridge3 = FactoryBot.create(:bridge)
      FactoryBot.create(:soundness, bridge: @bridge1, evaluation_at: '2018/05/21', overall_evaluation: 'one')
      FactoryBot.create(:soundness, bridge: @bridge2, evaluation_at: '2018/05/21', overall_evaluation: 'two')
      FactoryBot.create(:soundness, bridge: @bridge3, evaluation_at: '2018/05/21', overall_evaluation: 'three')
    end
    context 'call matrix' do
      it 'return values' do
        result = Dashboard.matrix
        expect(result['2018']).not_to eq(nil)
        expect(result['2018']['one']).not_to eq(nil)
        expect(result['2018']['one']).to eq([@bridge1])
      end
      context 'with newer values' do
        before do
          FactoryBot.create(:soundness, bridge: @bridge1, evaluation_at: '2020/05/21', overall_evaluation: 'two')
        end
        it 'return newer values' do
          result = Dashboard.matrix
          expect(result['2018']).not_to eq(nil)
          expect(result['2018']['one']).to eq(nil)
          expect(result['2020']).not_to eq(nil)
          expect(result['2020']['two']).to eq([@bridge1])
        end
      end
    end
  end
  describe 'sorted_overall_evaluations' do
    it 'return sorted value' do
      result = Dashboard.sorted_overall_evaluations
      expect(result).to eq(%w[unselected four three two one])
    end
  end
end
# rubocop:enable Metrics/BlockLength
