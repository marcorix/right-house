class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def show
    @report = Report.find(params[:id])
    @markers = [{lat: @report.latitude, lng: @report.longitude}]
  end

  def create

    @report = Report.new(report_params)
    @report.user = current_user

    if @report.save!
      redirect_to report_path(@report)
    else
      render "reports/new", status: :unprocessable_entity
    end

  end

  private

  def report_params
    params.require(:report).permit(:name, :latitude, :longitude)
  end
end
