$("#submit_product").on("click", function(e) {
  e.preventDefault();
  var formData = new FormData();
  var method = "<%= params[:id] ? 'PUT' : 'POST' %>";
  var request_url = '<%= "#{admin_products_path}/#{params[:id]}" %>';

  var product_attributes = <%= raw Product::ATTRIBUTES.collect{|attribute| attribute.to_s if attribute.class == Symbol}.compact %>;
  $.each(product_attributes, function(index, attribute) {
    var current_selector = $("#product_" + attribute);
    formData.append(current_selector.attr("name"), current_selector.val());
  });

  $.each(images, function(index, image) {
    formData.append("product[images][]", image);
  });

  $.each(removed_image_ids, function(index, image_id) {
    formData.append("product[removed_image_ids][]", image_id);
  });

  $.ajax({
    url: request_url,
    method: method,
    data: formData,
    dataType: "JSON",
    processData: false,
    contentType: false,
    success: function(response) {
      if (response.status) {
        window.location.replace("<%= admin_products_path %>");
      } else {
        alert(response.status);
      }
    }
  });
});
