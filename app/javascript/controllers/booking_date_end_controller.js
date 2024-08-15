import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="booking-date"
export default class extends Controller {
  connect() {
    flatpickr("#booking_end_date", {
      dateFormat: "d-m-Y",
      minDate: new Date().fp_incr(1),
      "locale": {
        "firstDayOfWeek": 1 // start week on Monday
        }
    })
  }
}
