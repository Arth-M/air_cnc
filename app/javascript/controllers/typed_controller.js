import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    var typed = new Typed('#typed', {
      strings: ['AirCnc', 'Fin the best for you'],
      typeSpeed: 50,
      loop: false,
    loopCount: Infinity
    });
  }
}
