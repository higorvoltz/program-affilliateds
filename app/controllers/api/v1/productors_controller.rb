# frozen_string_literal: true

class Api::V1::ProductorsController < ApplicationController # criar serializers
  def index
    @productors = Productor.all
    render json: @productors
  end

  def create
    @productor = Productor.create!(
      name: params[:name],
      email: params[:email],
      balance: params[:balance]
    )
    render json: @productor
  end

  def show
    @productor = Productor.find(params[:id])
    render json: @productor
  end

  def update
    @productor = Productor.find(params[:id])
    @productor.update(
      name: params[:name],
      email: params[:email],
      balance: params[:balance]
    )
    render json: @productor
  end

  def destroy
    @productors = Productor.all
    @productor = Productor.find(params[:id])
    @productor.destroy
    render json: @productor
  end
end
