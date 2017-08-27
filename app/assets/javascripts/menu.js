$(document).on('turbolinks:load', function() {
  if($('.show-bar').length > 0) {
    $('.index-bar-layout').addClass('show');
  }
});