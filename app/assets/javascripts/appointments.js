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
    console.log('Just set stuff:', context)
  }
});

$("#appointment_starts_at").pickatime();

