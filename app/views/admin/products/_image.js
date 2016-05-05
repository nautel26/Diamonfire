var images = new Object;
var exist_images = <%= attachments.map &:id %>;
var removed_image_ids = [];
var featured_image_id;

$("#add_image").on("click", function(e) {
  e.preventDefault();
  $("#product_images").click();
});

$("#product_images").on("change", function() {
  var image_preview = $("#image_preview");
  var files = $("#product_images")[0].files;
  var validate = true;
  $.each(files, function(index, file) {
    if (validate_file(file)) {
      var image_id = String(file.lastModified) + "_" + file.name;
      images[image_id] = file;
      var reader = new FileReader();
      reader.onload = function(e) {
        image_preview.append(image_wrap(e.target.result, image_id));
      }
      image_preview.show();
      reader.readAsDataURL(files[index]);
    } else {
      validate = false;
    }
  });
  if (!validate) {
    alert("<%= t 'shared.attachment_invalid' %>");
  }
  $(this).val("");
});

$(document).on("click", ".image_wrap .deleter", function() {
  var img_wrap = $(this).closest(".image_wrap");
  var image_id = img_wrap.attr("image_id");
  delete images[image_id];
  if (exist_images.indexOf(parseInt(image_id)) != -1) {
    removed_image_ids.push(image_id);
  }
  img_wrap.remove();
});

$(document).on("dblclick", ".image_wrap img", function() {
  $(".image_wrap .thumber").remove();
  console.log($(this));
  var img_wrap = $(this).closest(".image_wrap");
  img_wrap.append("<i class='fa thumber fa-star'></i>");
  featured_image_id = img_wrap.attr("image_id");
});

function image_wrap(src, image_id) {
  return "<div class='image_wrap' image_id='" + image_id + "'><img src='" + src +
    "' class='thumb_image'></img><i class='fa deleter fa-trash-o' aria-hidden='true'></i></div>"
}

function validate_file(file) {
  return file.size < <%= Settings.attachments.max_size %>;
}
