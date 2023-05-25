# frozen_string_literal: true

class Api::V1::AffiliatedsController < ApplicationController
  def index
    @affiliateds = Affiliated.all
    if @affiliateds.present?
      render json: @affiliateds, status: :ok
    else
      render json: { error: 'Affiliateds not found' }, status: :not_found
    end
  end

  def create
    @affiliated = Affiliated.create!(params_affiliated)
    if @affiliated.present?
      render json: @affiliated, status: :created
    else
      render json: { error: 'Unprocessable affiliated' }, status: :unprocessable_entity
    end
  end

  def show
    @affiliated = Affiliated.find(params[:id])
    if @affiliated.present?
      render json: @affiliated, status: :ok
    else
      render json: { error: 'Affiliated not found' }, status: :not_found
    end
  end

  def update
    @affiliated = Affiliated.find(params[:id])
    if @affiliated.present?
      @affiliated.update(params_affiliated)
      render json: @affiliated, status: :ok
    else
      render json: { error: 'Affiliated not found' }, status: :not_found
    end
  end

  def destroy
    @affiliateds = Affiliated.all
    @affiliated = Affiliated.find(params[:id])
    if @affiliated.present?
      @affiliated.destroy
      render json: @affiliateds, status: :ok
    else
      render json: { error: 'Affiliated not found' }, status: :not_found
    end
  end

  private

  def params_affiliated
    params.permit(:name, :email, :balance, :productor_id)
  end
end
