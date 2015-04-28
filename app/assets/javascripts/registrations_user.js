var checkboxes = $(".js-government-type"),
    submitButt = $("input[type='submit']");

  checkboxes.click(function() {
      submitButt.attr("disabled", !checkboxes.is(":checked"));
  });