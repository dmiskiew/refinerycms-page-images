$(document).ready(function(){
  $('#custom_images_tab a').click(function(){
    if (!(picker = $('#blog_image_picker')).data('size-applied')){
      wym_box = $('.blog_part:first .wym_box');
      iframe = $('.blog_part:first iframe');
      picker.css({
        height: wym_box.height()
        , width: wym_box.width()
      }).data('size-applied', true).corner('tr 5px').corner('bottom 5px').find('.wym_box').css({
        backgroundColor: 'white'
        , height: iframe.height() + $('.blog_part:first .wym_area_top').height() - parseInt($('.wym_area_top .label_inline_with_link a').css('lineHeight'))
        , width: iframe.width() - 20
        , 'border-color': iframe.css('border-top-color')
        , 'border-style': iframe.css('border-top-style')
        , 'border-width': iframe.css('border-top-width')
        , padding: '0px 10px 0px 10px'
      });
    }
  });

  reset_functionality();
});

reset_functionality = function() {
  $("#blog_images").sortable({
    'tolerance': 'pointer'
    , 'placeholder': 'placeholder'
    , 'cursor': 'drag'
    , 'items': 'li'
    , stop: reindex_images
  });

  $('#content #blog_images li:not(.empty)').each(function(index, li) {
    $(this).hover(function(e){
      if ((image_actions = $(this).find('.image_actions')).length == 0) {
        image_actions = $("<div class='image_actions'></div>");
        img_delete = $("<img src='/images/refinery/icons/delete.png' width='16' height='16' />");
        img_delete.appendTo(image_actions);
        img_delete.click(function() {
          $(this).parents('li[id*=image_]').remove();
          reindex_images();
        });

        image_actions.appendTo($(li));
      }

      image_actions.show();
    }, function(e) {
      $(this).find('.image_actions').hide();
    });
  });

  reindex_images();
}

image_added = function(image) {
  new_list_item = (current_list_item = $('li.empty')).clone();
  image_id = $(image).attr('id').replace('image_', '');
  current_list_item.find('input:hidden').val(image_id);

  $("<img />").attr({
    title: $(image).attr('title')
    , alt: $(image).attr('alt')
    , src: $(image).attr('data-grid') // use 'grid' size that is built into Refinery CMS (135x135#c).
  }).appendTo(current_list_item);

  current_list_item.attr('id', 'image_' + image_id).removeClass('empty');

  new_list_item.appendTo($('#blog_images'));
  reset_functionality();
}

reindex_images = function() {
  $('#blog_images li input:hidden').each(function(i, input){

    // make the image's name consistent with its position.
    parts = $(input).attr('name').split(']');
    parts[1] = ('[' + i);
    $(input).attr('name', parts.join(']'));

    // make the image's id consistent with its position.
    $(input).attr('id', $(input).attr('id').replace(/_\d_/, '_'+i+'_').replace(/_\d/, '_'+i));
  });
}