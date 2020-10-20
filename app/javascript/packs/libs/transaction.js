import "jstat/dist/jstat";
import formulajs from "formulajs";
import "jquery-mask-plugin/dist/jquery.mask";
 
  
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
 
// $("#transaction_item_formula").keyup(function () {
//   var value = $("#transaction_item_formula").val();
  
//   $("#transaction_item_value").val(value);
// });
 
    $("#transaction_item_formula").on("keyup", function (event) {
      event.preventDefault();
      $("#transaction_item_value").val(
        eval($("#transaction_item_formula").val())
      );
    });

    $(".function").each((index, component) => {
      var call = $(component).find(".function-call");
      call.on("click", function () {
        $("#in").val($(this).attr("data-function-call"));
        $("#formula-box").submit();
      });
    });

    const formulaKeys = Object.keys(formulajs);
    formulaKeys.forEach((key) => {
      window[key] = formulajs[key];
    });

 

