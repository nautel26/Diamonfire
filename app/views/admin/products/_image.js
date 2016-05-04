var images = new Object;
var exist_images = <%= attachments.map &:id %>;
var removed_image_ids = [];

$("#add_image").on("click", function(e) {
  e.preventDefault();
  $("#product_images").click();
});

$("#product_images").on("change", function() {
  var image_preview = $("#image_preview");
  var files = $("#product_images")[0].files;
  $.each(files, function(index, file) {
    var image_id = String(file.lastModified) + "_" + file.name;
    images[image_id] = file;
    var reader = new FileReader();
    reader.onload = function(e) {
      image_preview.append(image_wrap(e.target.result, image_id));
    }
    image_preview.show();
    reader.readAsDataURL(files[index]);
  });
  $(this).val("");
});

$(document).on("click", ".image_wrap .close", function() {
  var img_wrap = $(this).closest(".image_wrap");
  var image_id = img_wrap.attr("image_id");
  delete images[image_id];
  if (exist_images.indexOf(parseInt(image_id)) != -1) {
    removed_image_ids.push(image_id);
  }
  img_wrap.remove();
});

function image_wrap(src, image_id) {
  return "<div class='image_wrap' image_id='" + image_id + "'><span class='close'><i class='fa fa-trash-o' aria-hidden='true'></i></span><img src='" + src + "' class='thumb_image'></img></div>"
}
