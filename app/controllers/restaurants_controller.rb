class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update splitVote voteNoSplit newComment addComment ]

  # GET /restaurants or /restaurants.json
  def index
    @restaurants = Restaurant.all
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)
    @restaurant.splitVote = 0
    @restaurant.noSplitVote = 0
    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  #Adds a vote for the restaurant splitting the check
  def splitVote()
    @restaurant.splitVote = @restaurant.splitVote + 1
    @restaurant.save

    @vote = Vote.new(:user => current_user, :restaurant => @restaurant, :isSplitVote => true)
    @vote.save

    redirect_to restaurants_path
  end

  #Adds a vote for the restaurant not splitting the check
  def voteNoSplit
    @restaurant.noSplitVote = @restaurant.noSplitVote + 1
    @restaurant.save

    @vote = Vote.new(:user => current_user, :restaurant => @restaurant, :isSplitVote => false)
    @vote.save

    redirect_to restaurants_path
  end

  def search
    @restaurants = Restaurant.where("name LIKE ? OR location LIKE ?", "%" + params[:q] + "%", "%" + params[:q] + "%")
  end

  def addComment
    Comment.new(restaurant_id:@restaurant.id, user_id:current_user.id, comment:comment_params[:comment]).save

    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: "Comment was successfully created." }
      format.json { head :no_content }
    end
  end

  def newComment
    @comment = Comment.new
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  # def destroy
  #   @restaurant.destroy
  #
  #   respond_to do |format|
  #     format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :location, :splitVote, :noSplitVote)
    end

    def comment_params
      params.require(:comment).permit(:comment)
    end
end
