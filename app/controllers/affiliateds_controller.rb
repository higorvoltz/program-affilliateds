# frozen_string_literal: true

class AffiliatedsController < ApplicationController
  def index
    @affiliateds = Affiliated.all
    render json: @affiliateds
  end

  def create
    @affiliated = Affiliated.create(
      name: params[:name],
      email: params[:email]
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
      email: params[:email]
    )
    render json: @affiliated
  end

  def destroy
    @affiliated = Affiliated.find(params[:id])
    @affiliated.destroy
    render json: @affiliated
  end
end
