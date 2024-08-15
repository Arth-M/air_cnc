import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

// Connects to data-controller="booking-date"
export default class extends Controller {
  connect() {
    flatpickr("#booking_start_date", {
      dateFormat: "d-m-Y",
      minDate: "today",
      "locale": {
        "firstDayOfWeek": 1 // start week on Monday
        }
    })
  }
}
