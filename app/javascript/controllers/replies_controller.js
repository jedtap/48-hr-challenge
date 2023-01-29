import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="replies"
export default class extends Controller {
  static targets = ["replyBox"]

  toggle() {
    this.replyBoxTarget.hidden === true ? this.replyBoxTarget.hidden = false : this.replyBoxTarget.hidden = true
  }
}
