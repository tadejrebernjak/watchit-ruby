class VideosController < ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]

  # GET /videos or /videos.json
  def index
    @videos = Video.order('created_at DESC')
    @videosPopular = Video.most_hit.limit(5)
    @videosTrending = Video.most_hit(3.day.ago, 5)
  end

  def search
    @query = params[:query]
    @type = params[:type]

    @videos = Video.where("LOWER (title) like ?", "%" + @query.downcase + "%")
    @channels = User.where("LOWER (username) like ?", "%" + @query.downcase + "%").order(cached_votes_up: :desc)

    case @type
    when "recent"
      @videos = @videos.order('created_at DESC')
    when "oldest"
      @videos = @videos.order('created_at ASC')
    when "popular"
      @videos = @videos.most_hit
    when "trending"
      @videos = @videos.most_hit(1.day.ago, nil)
    else
      @type = "recent"
      @videos = @videos.order('created_at DESC')
    end
  end

  def upvote
    @video = Video.find(params[:id])
    if current_user.voted_up_on? @video
      @video.unvote_by current_user
    else
      @video.upvote_by current_user
    end
    render "vote.js.erb"
  end

  def downvote
    @video = Video.find(params[:id])
    if current_user.voted_down_on? @video
      @video.unvote_by current_user
    else
      @video.downvote_by current_user
    end
    render "vote.js.erb"
  end

  # GET /videos/1 or /videos/1.json
  def show
    commontator_thread_show(@video)
    @video.punch(request)
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos or /videos.json
  def create
    @video = Video.new(video_params)
    @video.user = current_user

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: "Video was successfully created." }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /videos/1 or /videos/1.json
  def update
    respond_to do |format|
      if @video.update(video_params)
        format.html { redirect_to @video, notice: "Video was successfully updated." }
        format.json { render :show, status: :ok, location: @video }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /videos/1 or /videos/1.json
  def destroy
    @video.destroy
    respond_to do |format|
      format.html { redirect_to videos_url, notice: "Video was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:title, :description, :thumbnail, :videoFile)
    end
end
