# frozen_string_literal: true

class Api::V1::ProductorAffiliatedsController < ApplicationController
  def index
    @productor_affiliateds = ProductorAffiliated.all
    render json: @productor_affiliateds
  end

  def create
    @productor_affiliated = ProductorAffiliated.create!(
      productor_id: params[:productor_id],
      affiliated_id: params[:affiliated_id]
    )
    render json: @productor_affiliated
  end

  def show
    @productor_affiliated = ProductorAffiliated.find(params[:id])
    render json: @productor_affiliated
  end

  def update
    @productor_affiliated = ProductorAffiliated.find(params[:id])
    @productor_affiliated.update(
      productor_id: params[:productor_id],
      affiliated_id: params[:affiliated_id]
    )
    render json: @productor_affiliated
  end

  def destroy
    @productor_affiliateds = ProductorAffiliated.all
    @productor_affiliated = ProductorAffiliated.find(params[:id])
    @productor_affiliated.destroy
    render json: @productor_affiliateds
  end
end
