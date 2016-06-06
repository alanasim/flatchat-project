var counter = 1

function myFunction(i) {
  if ($('select#select-' + i).val() == "username") {
    $('select#select-' + i).siblings().replaceWith('<div class="input"><label for="chat_users_attributes_' + i + '_username">Username</label>\
          <input type="text" name="chat[users_attributes][' + i + '][username]" id="chat_users_attributes_' + i + '_username" /></div>')
  } else {
    $('select#select-' + i).siblings().replaceWith('<div class="input"><label for="chat_users_attributes_' + i + '_phone_number">Phone number</label>\
          <input type="text" name="chat[users_attributes][' + i + '][phone_number]" id="chat_users_attributes_' + i + '_phone_number" /></div>')
  };
}

$(document).ready(function() {
  $('#add-user').on('click', function(e) {
    e.preventDefault()
    $('div#user-fields').append('\
        <div class="row">\
          <select onchange="myFunction(' + counter + ')" id="select-' + counter + '">\
            <option value="username">Username</option>\
            <option value="phone_number">Phone Number</option>\
          </select>\
          <div class="input">\
          <label for="chat_users_attributes_' + counter + '_username">Username</label>\
          <input type="text" name="chat[users_attributes][' + counter + '][username]" id="chat_users_attributes_' + counter + '_username" />\
          </div>\
        </div>');
    counter += 1
})

})