$(document).ready(function(){
    $('.sidebar').click(function(e) {
      e.preventDefault();
      console.log('hello');
    $('.index-bar-layout').toggleClass('show');
  });
});