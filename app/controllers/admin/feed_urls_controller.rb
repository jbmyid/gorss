class Admin::FeedUrlsController < Admin::BaseController
  # GET /feed_urls
  # GET /feed_urls.json
  def index
    @feed_urls = FeedUrl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @feed_urls }
    end
  end

  # GET /feed_urls/1
  # GET /feed_urls/1.json
  def show
    @feed_url = FeedUrl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @feed_url }
    end
  end

  # GET /feed_urls/new
  # GET /feed_urls/new.json
  def new
    @feed_url = FeedUrl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @feed_url }
    end
  end

  # GET /feed_urls/1/edit
  def edit
    @feed_url = FeedUrl.find(params[:id])
  end

  # POST /feed_urls
  # POST /feed_urls.json
  def create
    @feed_url = FeedUrl.new(params[:feed_url])

    respond_to do |format|
      if @feed_url.save
        format.html { redirect_to [:admin,@feed_url], notice: 'Feed url was successfully created.' }
        format.json { render json: @feed_url, status: :created, location: @feed_url }
      else
        format.html { render action: "new" }
        format.json { render json: @feed_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /feed_urls/1
  # PUT /feed_urls/1.json
  def update
    @feed_url = FeedUrl.find(params[:id])

    respond_to do |format|
      if @feed_url.update_attributes(params[:feed_url])
        format.html { redirect_to [:admin,@feed_url], notice: 'Feed url was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @feed_url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /feed_urls/1
  # DELETE /feed_urls/1.json
  def destroy
    @feed_url = FeedUrl.find(params[:id])
    @feed_url.destroy

    respond_to do |format|
      format.html { redirect_to admin_feed_urls_url }
      format.json { head :no_content }
    end
  end

  def activate
    @feed_url = FeedUrl.find(params[:id])
    @feed_url.activate
    redirect_to admin_feed_urls_path

  end


  def deactivate
    @feed_url = FeedUrl.find(params[:id])
    @feed_url.deactivate
    redirect_to admin_feed_urls_path

  end

  def generate_feeds
    @feed_url = FeedUrl.find(params[:id])
    @feed_url.generate_feed
    redirect_to admin_feed_urls_path
  end
end
