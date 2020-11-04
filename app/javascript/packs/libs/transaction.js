import "jstat/dist/jstat";
import flatpickr from "flatpickr";
import { Portuguese } from "flatpickr/dist/l10n/pt.js";
import formulajs from "formulajs";
import "jquery-mask-plugin/dist/jquery.mask";

// function to flatpickr
flatpickr.localize(Portuguese);
 $("#transaction_item_date").flatpickr(
  {dateFormat: "d/m/Y",}
 );

 // stared form script below 
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

    $("#transaction_item_formula").on("keyup", function (event) {
      event.preventDefault();
      $("#transaction_item_value").val(
        eval($("#transaction_item_formula").val())
      );
    });
 
    const formulaKeys = Object.keys(formulajs);
    formulaKeys.forEach((key) => {
      window[key] = formulajs[key];
    });

 

