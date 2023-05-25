# frozen_string_literal: true

class Api::V1::ProductorAffiliatedsController < ApplicationController
  def index
    @productor_affiliateds = ProductorAffiliated.all
    if @productor_affiliateds.present?
      render json: @productor_affiliateds, status: :ok
    else
      render json: { error: 'ProductorAffiliateds not found' }, status: :not_found
    end
  end

  def create
    @productor_affiliated = ProductorAffiliated.create!(productor_affiliated_params)
    if @productor_affiliated.present?
      render json: @productor_affiliated, status: :created
    else
      render json: { error: 'Unprocessable productorAffiliated' }, status: :unprocessable_entity
    end
  end

  def show
    @productor_affiliated = ProductorAffiliated.find(params[:id])
    if @productor_affiliated.present?
      render json: @productor_affiliated, status: :ok
    else
      render json: { error: 'ProductorAffiliated not found' }, status: :not_found
    end
  end

  def update
    @productor_affiliated = ProductorAffiliated.find(params[:id])
    if @productor_affiliated.present?
      @productor_affiliated.update(productor_affiliated_params)
      render json: @productor_affiliated, status: :ok
    else
      render json: { error: 'ProductorAffiliated not found' }, status: :not_found
    end
  end

  def destroy
    @productor_affiliateds = ProductorAffiliated.all
    @productor_affiliated = ProductorAffiliated.find(params[:id])
    if @productor_affiliated.present?
      @productor_affiliated.destroy
      render json: @productor_affiliateds, status: :ok
    else
      render json: { error: 'ProductorAffiliated not found' }, status: :not_found
    end
  end

  private

  def productor_affiliated_params
    params.permit(:productor_id, :affiliated_id)
  end
end
