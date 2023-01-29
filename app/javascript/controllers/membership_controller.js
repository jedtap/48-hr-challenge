import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="membership"
export default class extends Controller {
  static targets = ["submit"]
  
  delete() {
    this.submitTarget.click();
  }
}
