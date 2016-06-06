var counter = 2

$(document).ready(function() {
  $('#add-user').on('click', function(e) {
    e.preventDefault()
    $('div#user-fields').append('<label for="user' + counter + '">User</label> <input type="text" name="user' + counter + '" id="user' + counter + '" /></br>')
})
})