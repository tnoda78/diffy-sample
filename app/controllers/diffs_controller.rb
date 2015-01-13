class DiffsController < ApplicationController
  def create
    @diff = Diff.new(diffs_params)
    render :show
  end

  def new
    @diff = Diff.new
  end

  private
  def diffs_params
    params.require(:diff).permit(:before, :after)
  end
end
