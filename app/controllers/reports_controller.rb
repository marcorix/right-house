class ReportsController < ApplicationController
  def new
    @report = Report.new
  end

  def create

    @report = Report.new(report_params)

    respond_to do |format|
      if @report.save!
        format.html { redirect_to report_path(@report) }
        format.json # Follows the classic Rails flow and look for a create.json view
      else
        format.html { render "reports/new", status: :unprocessable_entity }
        format.json # Follows the classic Rails flow and look for a create.json view
      end
    end
  end

  private

  def report_params
    params.require(:report).permit(:name, :latitude, :longitude, :user_id)
  end
end
