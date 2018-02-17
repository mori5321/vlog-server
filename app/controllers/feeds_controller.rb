class FeedsController < ApplicationController
  before_action :set_feed, only: [:show, :update, :destroy]

  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authenticate, except: [:index, :show]

  # GET /feeds
  def index
    @feeds = Feed.order(id: :desc)
    render 'index', formats: 'json', handlers: 'jbuilder'
  end

  # GET /feeds/1
  def show
    render json: @feed
  end

  # POST /feeds
  def create
    @feed = Feed.new(feed_params)

    if @feed.save
      render json: @feed, status: :created, location: @feed
    else
      render json: @feed.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /feeds/1
  def update
    if @feed.update(feed_params)
      render json: @feed
    else
      render json: @feed.errors, status: :unprocessable_entity
    end
  end

  # DELETE /feeds/1
  def destroy
    @feed.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_feed
      @feed = Feed.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def feed_params
      params.permit(:text)
    end

    #FIXME: ここのtokenがとれずinvalidなんとかになってしまう。
    def authenticate
      authenticate_or_request_with_http_token do |token, options|
        auth_user = User.find_by(token: token)
        # auth_user != nil ? true : false
        return true
      end
    end
end
