class LinksController < ApplicationController
  before_action :set_link, only: [:show, :edit, :update, :destroy]

  # GET /links
  # GET /links.json
  def index
    @links = Link.all
  end

  # GET /links/1
  # GET /links/1.json
  def show
  end

  # GET /links/new
  def new
    @page = Page.find(params[:page_id])
    @link = @page.links.new
    if current_user.page != @page && current_user.authorisation < 30
      redirect_to(root_path)
    end
  end

  # GET /links/1/edit
  def edit
    if current_user.page != @page && current_user.authorisation < 30
      redirect_to(root_path)
    end
  end

  # POST /links
  # POST /links.json
  def create
    @page = Page.find(params[:page_id])
    if current_user.page != @page && current_user.authorisation < 30
      redirect_to(root_path)
    end
    @link = @page.links.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to @page, notice: 'Link was successfully created.' }
        format.json { render :show, status: :created, location: @page }
      else
        format.html { render :new }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /links/1
  # PATCH/PUT /links/1.json
  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to page_path(@page), notice: 'Link was successfully updated.' }
        format.json { render :show, status: :ok, location: @pahe }
      else
        format.html { render :edit }
        format.json { render json: @link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /links/1
  # DELETE /links/1.json
  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to @page, notice: 'Link was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_link
      @page = Page.find(params[:page_id])
      @link = @page.links.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:name, :link,:slug)
    end
end
