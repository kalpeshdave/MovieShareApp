class VideosController < ApplicationController

  def new
    @video = Video.new
  end

  def create
    @video = current_user.videos.build(video_params)
    if @video.save
      redirect_to root_path, notice: "Successfully shared movie."
    else
      render :new
    end
  end

  private

  def video_params
    params.require(:video).permit(:url)
  end
end