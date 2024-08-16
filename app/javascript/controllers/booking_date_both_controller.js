import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="booking-date"
export default class extends Controller {
  static targets = ["entryDate"]

  connect() {
    console.log('booking_date_both connected')
    flatpickr(this.entryDateTarget, {
      mode: "range",
      minDate: "today",
      dateFormat: "d-m-Y",
      onChange: (selectedDates) => {
        console.log(this.entryDateTarget.value);
        console.log(selectedDates);
        console.log(selectedDates[0].parseDate);
        if (selectedDates.length === 2) {
          this.entryDateTarget.value = selectedDates[0].fp_incr(1).toISOString().split('T')[0].split("-").reverse().join("-");
          document.getElementById('booking_end_date').value = selectedDates[1].fp_incr(1).toISOString().split('T')[0].split("-").reverse().join("-");
        }
      },
      "locale": {
      "firstDayOfWeek": 1 // start week on Monday
      }
    })
  }
}
