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
          .prop("placeholder","");
        $("#appointment_starts_at").pickatime({
          disable: data,
          interval: 120,
          min: [8, 0], 
          max: [18, 0]
        });
      });
  }
});



// getJson in onSet of the available hours or disabled hours.
// generate an object to cantain available hours and a route that responds to
// json in index
// use that json to populate the array of the pickatime()
// hide text and unhide pickatime
