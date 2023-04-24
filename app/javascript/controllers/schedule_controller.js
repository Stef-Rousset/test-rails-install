import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["day", "div"]
  static values = { index: Number }

  show(){
    const insertedParagraphs = document.querySelectorAll('.inserted')
    insertedParagraphs.forEach(elem => elem.remove())
    const input = this.dayTarget
    const dayInput = input.value
    const div = this.divTarget
    const id = this.indexValue
    let schedule;

    fetch(`/shops/${id}.json`, {
            method: 'GET', // *GET, POST, PUT, DELETE, etc.
            mode: 'cors', // no-cors, *cors, same-origin
            cache: 'no-cache', // *default, no-cache, reload, force-cache, only-if-cached
            credentials: 'same-origin', // include, *same-origin, omit
            headers: {
                'Content-Type': 'application/json',
            }
          })
          .then((response) => {
              if (response.ok) {
                  return response.json();
              } else {
                  div.insertAdjacentHTML('afterend', `<p class="inserted">Pas d'horaire pour ce jour</p>`)
                  return Promise.reject(response);
              }
              })
          .then((data) => {
              schedule = data.filter(elem => elem.day == dayInput)[0]
              if (schedule){
                  let closed = schedule.closed
                  let opening = new Date(schedule.opening)
                  let closing = new Date(schedule.closing)
                  let middayClosing = new Date(schedule.midday_closing)
                  let middayOpening = new Date(schedule.midday_opening)

                  if (closed == true){
                    div.insertAdjacentHTML('afterend', `<p class="inserted">${schedule.day} : Fermé</p>`)
                  } else if (middayClosing == "undefined"){
                    div.insertAdjacentHTML('afterend', `<p class="inserted">${schedule.day} : ${opening.toLocaleTimeString('fr-FR')}-${closing.toLocaleTimeString('fr-FR')}</p>`)
                  } else {
                    div.insertAdjacentHTML('afterend', `<p class="inserted">${schedule.day} : ${opening.toLocaleTimeString('fr-FR')}-${middayClosing.toLocaleTimeString('fr-FR')}, ${middayOpening.toLocaleTimeString('fr-FR')}-${closing.toLocaleTimeString('fr-FR')}</p>`)
                  }
              } else {
                  div.insertAdjacentHTML('afterend', `<p class="inserted">Pas d'horaire pour ce jour</p>`)
              }
          })
  }
}

