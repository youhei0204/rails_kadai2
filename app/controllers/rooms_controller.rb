class RoomsController < ApplicationController
  
  def show
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end

  def index
    #エリア,キーワード入力時
    if params[:name].present? || params[:location].present?
      @rooms = Room.where('name like ?', "%#{params[:name]}%").where('location like ?', "%#{params[:location]}%").order(updated_at: "DESC")
      @keyword = params[:name]
      @location = params[:location]
    else
      @rooms = Room.all.order(updated_at: "DESC")
    end
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = current_user.rooms.build(room_params)
    if @room.save
      flash[:success] = "ルーム登録が完了しました"
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
      flash[:success] = "ユーザー情報を更新しました"
      redirect_to @room
    else
      render 'edit'
    end
  end
  
  def destroy
    room = Room.find(params[:id])
    room.delete
    flash[:info] = "ルームを削除しました"
    redirect_to current_user
  end
  
  private
    
    def room_params
      params.require(:room).permit(:name, :introduction, :location, :price, :image)
    end

end
