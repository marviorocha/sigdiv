import formulajs from "formulajs";
import $ from "jquery";
import "jquery-mask-plugin";
const transactionValue = document.getElementById("transactionModal");

// function logKey(e) {
//   log.textContent += ` ${e.code}`;
// }

console.log(transactionValue);

function TransactionFormula() {
  $("#transaction_item_exchange_rate").keyup(function () {
    var value = $("#transaction_item_value").val().replace(/[,]/g, "");
    $("#transaction_item_formula").val(value);
  });
}

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

$("div.transaction_item_formula").on("keyup", "input", function (e) {
  $.get(
    "/formulas/show/" + $(".transaction_item_formula input").val() + ".json"
  ).done(function (data) {
    $(".transaction_item_value input").val(data.response);
  });
});

TransactionFormula();
