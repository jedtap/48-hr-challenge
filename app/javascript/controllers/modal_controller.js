import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static targets = ["modalArea"]

    toggle(){
        this.modalAreaTarget.hidden === true ? this.modalAreaTarget.hidden = false : this.modalAreaTarget.hidden = true
    }
}
