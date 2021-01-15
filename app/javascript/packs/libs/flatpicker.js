require("flatpickr/dist/themes/material_green.css");
import flatpickr from "flatpickr";
import { Portuguese } from "flatpickr/dist/l10n/pt.js";

// function to flatpickr
flatpickr.localize(Portuguese);
$("#currency_date_currency").flatpickr({ dateFormat: "d/m/Y" });

 
