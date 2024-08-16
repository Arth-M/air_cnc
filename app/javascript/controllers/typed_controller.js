import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="typed"
export default class extends Controller {
  connect() {
    var typed = new Typed('#typed', {
      strings: ['AirCnc', 'Find the best for you', 'Batch Toulouse #1738'],
      typeSpeed: 50,
      loop: true,
    loopCount: Infinity
    });
  }
}
