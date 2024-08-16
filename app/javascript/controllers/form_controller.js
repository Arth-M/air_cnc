import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="form"
export default class extends Controller {
  static targets = [ "submitButton"]
  connect() {
    console.log('Form controller is in tha place!')
  }

  submit() {
    this.submitButtonTarget.innerText("Thank you!");
  }
}
