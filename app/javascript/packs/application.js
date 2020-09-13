// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
require("trix")
require("@rails/actiontext")

import $ from 'jquery'

document.getElementById("Profile_picture img").onclick = function() {
    // ここに#buttonをクリックしたら発生させる処理を記述する
};

document.addEventListener('turbolinks:load', () => {
    setTimeout(function() {
      $('.notice_pop-up p').fadeOut();
  }, 5000);
})

$('#upload_file').on('change', function(){ // 解説①
    var strFileInfo = $(#upload_file)[0].files[0]; // 解説②
    if(strFileInfo && strFileInfo.type.match('image.*')){ // 解説③

      $('#preview').remove();  // 解説④
      $('#preview_area').append('<img id="preview" width="300" />'); // 解説⑤

      fileReader = new FileReader(); // 解説⑥
      fileReader.onload = function(event){
        $('#preview').attr('src', event.target.result);
      }

      fileReader.readAsDataURL(strFileInfo); // 解説⑦
    }
  });