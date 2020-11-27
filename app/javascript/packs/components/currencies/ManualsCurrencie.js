import axios from "axios";

const url_item = document.getElementById("delete_me").getAttribute("data-url");

const DeleteItem = async () => {
  let deleted_manual = await axios.delete(url_item);
  deleted_manual.status;
};

$("#delete_me").on("click", function () {
  const delete_item_of_manual = confirm("Deseja apagar esse item?");
  if ((delete_item_of_manual = true)) {
    DeleteItem();
    location.reload();
  } else {
    return false;
  }
});
