class SnotesController < ApplicationController
  before_action :set_snote, only: [:show, :edit, :update, :destroy]

  # GET /snotes
  # GET /snotes.json
  def index
    @snotes = Snote.all
  end

  # GET /snotes/1
  # GET /snotes/1.json
  def show
  end

  # GET /snotes/new
  def new
    @snote = Snote.new
  end

  # GET /snotes/1/edit
  def edit
  end

  # POST /snotes
  # POST /snotes.json
  def create
    @snote = Snote.new(snote_params)
    @snote.note_id = params["note_id"]
    @snote.user_id = current_user.id

    respond_to do |format|
      if @snote.save
        format.html { redirect_to @snote, notice: 'Snote was successfully created.' }
        format.json { render :show, status: :created, location: @snote }
      else
        format.html { render :new }
        format.json { render json: @snote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /snotes/1
  # PATCH/PUT /snotes/1.json
  def update
    respond_to do |format|
      if @snote.update(snote_params)
        format.html { redirect_to @snote, notice: 'Snote was successfully updated.' }
        format.json { render :show, status: :ok, location: @snote }
      else
        format.html { render :edit }
        format.json { render json: @snote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /snotes/1
  # DELETE /snotes/1.json
  def destroy
    @snote.destroy
    respond_to do |format|
      format.html { redirect_to snotes_url, notice: 'Snote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_snote
      @snote = Snote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def snote_params
      params.require(:snote).permit(:title, :answer, :pnote, :freq, :user_id, :note_id)
    end
end
