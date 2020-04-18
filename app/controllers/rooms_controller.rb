class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to rooms_path
    else
      render :new
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    @room.update(room_params)
    if @room.save
      flash[:success] = "Successfully edited"
      redirect_to rooms_path
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:success] = "Successfully deleted"
    redirect_to rooms_path
  end

  protected
    def room_params
      params.require(:room).permit(:title, :description, :beds, :guests, :price_per_night, :image_url)
    end
end
