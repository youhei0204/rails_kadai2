class RoomsController < ApplicationController
  
  def show
    @room = Room.find(params[:id])
  end

  def index
    #エリア,キーワード入力時
    @rooms = Room.all
    if params[:name].present? || params[:location].present?
      @rooms = Room.where('name like ?', "%#{params[:name]}%").where('location like ?', "%#{params[:location]}%")
    #条件未指定, (new,editビューからのpost含む)
    else
      @rooms = Room.all
    end
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to @room
    else
      render 'new'
    end
  end

  def edit
    @room = Room.find(params[:id])
  end
  
  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to @room
    else
      render 'edit'
    end
  end
  
  private
    
    def room_params
      params.require(:room).permit(:name, :introduction, :location, :price)
    end

end
