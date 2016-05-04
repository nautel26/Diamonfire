var category_detail;
var category_form;
var category_id;

$(document).on("click", ".edit_category", function(e) {
  e.preventDefault();
  category_detail = $(this).closest("tr");
  category_id = category_detail.attr("category_id");
  category_form = category_detail.next(".category_form");
  category_form.find(".category_name").val(category_detail.find(".category_name").html());
  category_form.find(".category_description").val(category_detail.find(".category_description").html());
  showForm();
});

$(document).on("click", ".cancel_edit_category", function(e) {
  e.preventDefault();
  hideForm();
});

$(document).on("click", ".save_category", function(e) {
  var formData = new FormData;
  formData.append("category[name]", category_form.find(".category_name").val());
  formData.append("category[description]", category_form.find(".category_description").val());
  $.ajax({
    url: "/admin/categories/" + category_id,
    method: "PUT",
    data: formData,
    dataType: "script",
    processData: false,
    contentType: false
  });
});

function hideForm() {
  category_detail.show();
  category_form.hide();
}

function showForm() {
  category_detail.hide();
  category_form.show();
}
