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
    formData.append("product[image_ids][]", String(image.lastModified) + "_" + image.name);
  });

  $.each(removed_image_ids, function(index, image_id) {
    formData.append("product[removed_image_ids][]", image_id);
  });

  formData.append("product[featured_image_id]", featured_image_id);

  $.ajax({
    url: request_url,
    method: method,
    data: formData,
    dataType: "script",
    processData: false,
    contentType: false
  });
});
