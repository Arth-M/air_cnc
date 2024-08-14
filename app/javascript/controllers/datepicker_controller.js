import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="datepicker"
export default class extends Controller {
  connect() {
    console.log('datepicker controller is in tha place!')
    flatpickr(".date", {});
  }
}
