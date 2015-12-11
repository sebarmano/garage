$("#appointment_date_on").pickadate({
  // Days available
  min: 1,
  max: 60,
  disable: [1, 8, 15, 22, 29, 36, 43, 50, 57],

  // Buttons
  today: "",
  clear: "Borrar día seleccionado",
  close: "Cerrar",

  onSet: function(context) {
    var dateSelected = this.get()
      $.getJSON("/available_hours", {date: dateSelected}, function(data) {
          $("#appointment_starts_at")
          .prop("disabled", false)
          .prop("placeholder","")
          .focus();
        $("#appointment_starts_at").pickatime({
          disable: data,
          interval: 120,
          min: [8, 0],
          max: [18, 0]
        });
      });
  }
});

var $checkboxes = $(".booked-appointments :checkbox");

$("#select-all-button").click(function(e) {
  e.preventDefault();
  if ($(this).text() == "Marcar todos") {
    $checkboxes.prop('checked', true);
    $checkboxes.closest('tr').addClass('selected');
    $(this).text("Desmarcar todos");
  } else {
    $checkboxes.prop('checked', false);
    $(this).text("Marcar todos");
    $checkboxes.closest('tr').removeClass('selected');
  }
});

$checkboxes.change(function () {
  if( $(this).is(':checked') ) {
    $(this).closest('tr').addClass('selected');
  } else {
    $(this).closest('tr').removeClass('selected'); }
});

