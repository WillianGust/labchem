$(document).ready(function() {
  $('#new-user-form').on('submit', function(event) {
    event.preventDefault();

    var formData = $(this).serialize();

    $.ajax({
      type: 'POST',
      url: '/formulations',
      data: formData,
      dataType: 'json'
    }).done(function(data) {
      var newRow = '<tr><td>' + data.project_name + '</td><td>' + data.description + '</td></tr>';

      $('#users-table tbody').append(newRow);
      $('#new-user-form')[0].reset();
    });
  });
});