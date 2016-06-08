var counter = 1
var currentField

function myFunction(i) {
  if ($('select#select-' + i).val() == "username") {
    $('select#select-' + i).siblings().replaceWith('<div class="input"><label for="chat_users_attributes_' + i + '_username">Username</label>\
          <input type="text" name="chat[users_attributes][' + i + '][username]" id="chat_users_attributes_' + i + '_username" /><div id="validation" style="display:inline"></div></div>')
  } else {
    $('select#select-' + i).siblings().replaceWith('<div class="input"><label for="chat_users_attributes_' + i + '_phone_number">Phone number</label>\
          <input type="text" name="chat[users_attributes][' + i + '][phone_number]" id="chat_users_attributes_' + i + '_phone_number" /><div id="validation" style="display:inline"></div></div>')
  };
  validateUsername()
  validatePhoneNumber()
  disableSubmit()
}

function setCurrentField() {
  $('input').focus(function() {
      currentField = $(':focus')
      var prevField = ''
    })
}

function setPrevField() {
  $('input').blur(function() {
      prevField = currentField
      alert(prevField.attr('id'))
    })
}

// function validateUsername() {
//   $('[id*='+'username'+']').blur(function() {
//       $.ajax ({
//         url: '/chats/validate_username',
//         method: 'post',
//         data: {value: prevField.val(), id: prevField.attr('id')}
//       })
//     })
// }

function validateUsername() {
  $('[id*='+'username'+']').keyup(function() {
    $.ajax ({
        url: '/chats/validate_username',
        method: 'post',
        data: {value: $(this).val(), id: $(this).attr('id')}
      })
  })
}

function disableSubmit() {
  $('input#start-chat').prop('disabled', true);
  $('input[type="text"]').keyup(function() {
    if($('div#validation').text().includes("Invalid") == false) {
       $('input#start-chat').prop('disabled', false);
    }
  });
}
function enableSubmit() {
  if($('div#validation').text().includes("Invalid") == false) {
       $('input#start-chat').prop('disabled', false);
    }
}

function validatePhoneNumber() {
  $('[id*='+'phone_number'+']').keyup(function() {
    $.ajax ({
      url: '/chats/validate_phonenumber',
      method: 'post',
      data: {value: $(':focus').val(), id: $(':focus').attr('id')}
    })
  })
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
            <div id="validation" style="display:inline">\
            </div>\
          </div>\
        </div>');
    counter += 1
    validateUsername()
    validatePhoneNumber()
    disableSubmit()
  })

  validateUsername()
  validatePhoneNumber()
  disableSubmit()
})