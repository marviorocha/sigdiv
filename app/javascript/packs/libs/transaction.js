import "jstat/dist/jstat";
import formulajs from "formulajs";
import "jquery-mask-plugin/dist/jquery.mask";
import $ from "jquery/dist/jquery";
  
$(".currency-brl").unmask();
$(".currency").unmask();

$("#transaction_item_exchange_rate").on("keyup", function (e) {
  updateValue();
});

$(".mask-field").on("keyup", function (e) {
  $(".currency-brl").mask("#.##0,0000", { reverse: true });
  $(".currency").mask("#.##0,00000", { reverse: true });
});

function updateValue() {
  if ($.isNumeric($("#transaction_item_exchange_rate").val())) {
    $("#transaction_item_value").val(
      (
        Big(
          $("#transaction_item_value_brl")
            .val()
            .replace(/[.]/g, "")
            .replace(/[,]/g, ".")
        ) * $("#transaction_item_exchange_rate").val().replace(/[,]/g, ".")
      ).toFixed(5)
    );
  }
  $(".currency").unmask();
  $(".currency").mask("#.##0,00000", { reverse: true });
} 
 
$("#transaction_item_formula").keyup(function () {
  var value = $("#transaction_item_formula").val();
  console.log(formulajs.SUM(5 + 5 + 5));
  $("#transaction_item_value").val(value);
});
 

 
