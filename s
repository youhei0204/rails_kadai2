
[1mFrom:[0m /home/ec2-user/environment/potepan_rails/kadai2/air6n6/app/controllers/rooms_controller.rb:9 RoomsController#index:

     [1;34m6[0m: [32mdef[0m [1;34mindex[0m
     [1;34m7[0m:   [1;34m#エリア入力時[0m
     [1;34m8[0m:   @rooms = [1;34;4mRoom[0m.all
 =>  [1;34m9[0m:   binding.pry 
    [1;34m10[0m:   [32mif[0m !(params[[33m:location[0m]&.empty?)
    [1;34m11[0m:      
    [1;34m12[0m:     @rooms = [1;34;4mRoom[0m.where([35mlocation[0m: params[[33m:location[0m]).where([31m[1;31m'[0m[31mname like ?[1;31m'[0m[31m[0m, [31m[1;31m"[0m[31m%#{params[:name]}[0m[31m%[1;31m"[0m[31m[0m)
    [1;34m13[0m:   [1;34m#エリア未入力, キーワード入力時[0m
    [1;34m14[0m:   [32melsif[0m !(params[[33m:name[0m]&.empty?)
    [1;34m15[0m:     @rooms = [1;34;4mRoom[0m.where([31m[1;31m'[0m[31mname like ?[1;31m'[0m[31m[0m, [31m[1;31m"[0m[31m%#{params[:name]}[0m[31m%[1;31m"[0m[31m[0m)
    [1;34m16[0m:   [1;34m#条件未指定[0m
    [1;34m17[0m:   [32melse[0m
    [1;34m18[0m:     @rooms = [1;34;4mRoom[0m.all
    [1;34m19[0m:   [32mend[0m
    [1;34m20[0m: [32mend[0m

