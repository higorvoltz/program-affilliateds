# frozen_string_literal: true

class AffiliatedsController < ApplicationController
  def index
    @affiliateds = Affiliated.all
    render json: @affiliateds
  end

  def create
    @affiliated = Affiliated.create!(
      name: params[:name],
      email: params[:email],
      balance: params[:balance],
      productor_id: params[:productor_id]
    )
    render json: @affiliated
  end

  def show
    @affiliated = Affiliated.find(params[:id])
    render json: @affiliated
  end

  def update
    @affiliated = Affiliated.find(params[:id])
    @affiliated.update(
      name: params[:name],
      email: params[:email],
      balance: params[:balance],
      productor_id: params[:productor_id]
    )
    render json: @affiliated
  end

  def destroy
    @affiliateds = Affiliated.all
    @affiliated = Affiliated.find(params[:id])
    @affiliated.destroy
    render json: @affiliated
  end
end
