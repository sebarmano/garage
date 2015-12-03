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
     console.log(data) 
    }); 
  }
});

$("#appointment_starts_at").pickatime();


// getJson in onSet of the available hours or disabled hours. 
// generate an object to cantain available hours and a route that responds to
// json in index
// use that json to populate the array of the pickatime()
// hide text and unhide pickatime
