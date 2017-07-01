class ReviewsController < ApplicationController

  def new
    @project = Project.find(params[:project_id])
    @review = @project.reviews.new
  end

  def create
    @project = Project.find(params[:project_id])
    @review = @project.reviews.new(review_params)
    if @review.save
      redirect_to project_path(@review.project)
    else
      render :new
    end
  end

private
  def review_params
    params.require(:review).permit(:author, :content_body, :rating)
  end

end
