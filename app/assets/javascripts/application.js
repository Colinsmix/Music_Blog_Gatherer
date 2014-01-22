// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require backstretch.min
//= require_tree .


$(function(){ $(document).foundation(); });

$(function () {
  $('#search').on('submit', function(event) {
    event.preventDefault();
  });

  $(document).on("click", '#blogs th a, #blogs .pagination a, #blogs .like, #blogs .dislike', function () {
    $.getScript(this.href);
    return false;
  });
  $('#blogs_search input').keyup(function () {
    $.get($("#blogs_search").attr("action"), $("#blogs_search").serialize(), null, 'script');
    $('.togglehide').show();
    return false;
  });
});

$(function(){
  $.backstretch("https://dl.dropboxusercontent.com/u/134623784/lifemusic1.png");
})

