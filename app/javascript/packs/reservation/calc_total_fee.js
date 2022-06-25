
//ルーム予約画面で合計金額をリアルタイム表示する
document.getElementById("guests").addEventListener("input", calcTotalFee, false);
document.getElementById("start_date").addEventListener("input", calcTotalFee, false); 
document.getElementById("end_date").addEventListener("input", calcTotalFee, false);

function calcTotalFee() {
  var term = calcTerm();
  var guests = document.getElementById( "guests" ).value;
  var price = document.getElementById( "price" ).textContent;
  
  if(term >= 1){
    var total_fee = term * guests * Number(price);
  }else{
    var total_fee = 0
  }
  document.getElementById( "total_fee" ).innerHTML = "¥ " + total_fee;
}

function calcTerm() {
  var start_date = new Date(document.getElementById( "start_date" ).value);
  var end_date   = new Date(document.getElementById( "end_date" ).value);
  var term = (end_date - start_date) / 86400000;
  return term;
}