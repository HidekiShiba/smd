class Public::ExaminationsController < ApplicationController
  def show
    @examination = Examination.find(params[:id])
  end
end
