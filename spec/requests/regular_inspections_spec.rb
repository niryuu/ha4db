# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

# rubocop:disable Metrics/BlockLength
RSpec.describe '/regular_inspections', type: :request do
  before do
    @user = FactoryBot.create(:user)
    allow_any_instance_of(ActionDispatch::Request).to receive(:session).and_return({ user_id: @user.id })
  end
  # RegularInspection. As you add validations to RegularInspection, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      RegularInspection.create! valid_attributes
      get regular_inspections_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      regular_inspection = RegularInspection.create! valid_attributes
      get regular_inspection_url(regular_inspection)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_regular_inspection_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      regular_inspection = RegularInspection.create! valid_attributes
      get edit_regular_inspection_url(regular_inspection)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new RegularInspection' do
        expect do
          post regular_inspections_url, params: { regular_inspection: valid_attributes }
        end.to change(RegularInspection, :count).by(1)
      end

      it 'redirects to the created regular_inspection' do
        post regular_inspections_url, params: { regular_inspection: valid_attributes }
        expect(response).to redirect_to(regular_inspection_url(RegularInspection.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new RegularInspection' do
        expect do
          post regular_inspections_url, params: { regular_inspection: invalid_attributes }
        end.to change(RegularInspection, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post regular_inspections_url, params: { regular_inspection: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested regular_inspection' do
        regular_inspection = RegularInspection.create! valid_attributes
        patch regular_inspection_url(regular_inspection), params: { regular_inspection: new_attributes }
        regular_inspection.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the regular_inspection' do
        regular_inspection = RegularInspection.create! valid_attributes
        patch regular_inspection_url(regular_inspection), params: { regular_inspection: new_attributes }
        regular_inspection.reload
        expect(response).to redirect_to(regular_inspection_url(regular_inspection))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        regular_inspection = RegularInspection.create! valid_attributes
        patch regular_inspection_url(regular_inspection), params: { regular_inspection: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested regular_inspection' do
      regular_inspection = RegularInspection.create! valid_attributes
      expect do
        delete regular_inspection_url(regular_inspection)
      end.to change(RegularInspection, :count).by(-1)
    end

    it 'redirects to the regular_inspections list' do
      regular_inspection = RegularInspection.create! valid_attributes
      delete regular_inspection_url(regular_inspection)
      expect(response).to redirect_to(regular_inspections_url)
    end
  end
end
# rubocop:enable Metrics/BlockLength
