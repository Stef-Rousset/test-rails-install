import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['form', 'list', 'searchInput', 'button']

  connect() {
    console.log(this.element)
    console.log(this.formTarget)
    console.log(this.listTarget)
    console.log(this.searchInputTarget)
    console.log(this.buttonTarget)
    this.searchInputTarget.value = ""
  }

  update() {
    console.log(this.searchInputTarget.value)
    const url = `${this.formTarget.action}?query=${this.searchInputTarget.value}`
    fetch(url, { headers: { 'Accept': 'text/plain' } })
    .then(response => response.text())
    .then((data) => { this.listTarget.outerHTML = data })
  }
}
