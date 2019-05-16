//= require jquery
//= require jquery_ujs
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap
//= require moment
//= require moment/zh-cn.js
//= require tempusdominus-bootstrap-4.js

$(document).on("turbolinks:load", function() {
  $('#datetimepicker2').datetimepicker({
  });

  $('#form-modal-save-btn').click(function() {
    $('#form-modal-body').find('form').submit();
  });
})
