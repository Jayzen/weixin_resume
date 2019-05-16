//= require rails-ujs
//= require jquery3
//= require activestorage
//= require turbolinks
//= require popper
//= require bootstrap
//= require simplemde.min
//= require blog/inline-attachment
//= require blog/codemirror-4.inline-attachment

$(document).on("turbolinks:load", function() {
  $('#form-modal-save-btn').click(function() {
    $('#form-modal-body').find('form').submit();
  });
})
