import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["slide"] //crée la propriété pr la cible slide this.slideTarget si une slide, sinon this.slideTargets

  // initialize is invoked once when controller is instantiated
  // connect is invoked anytime when the controller is connected to the DOM
  // disconnect is invoked anytime when the controller is disconnected from the DOM
  initialize() {
      console.log(this.element) //this.element correspond à la div qui porte le data-controller
      this.index = 0
      this.showCurrentSlide()

    }
    next(){
      if (this.index < 2){
        this.index++
        console.log(this.index)
        this.showCurrentSlide()
      }
    }
    previous(){
      if (this.index > 0){
      this.index--
      this.showCurrentSlide()
      }
    }
    showCurrentSlide(){
      this.slideTargets.forEach((element, index) => {
        if (index !== this.index){
          element.hidden = true;
        } else{
          element.hidden = false;
        }
        //element.hidden = index !== this.index
      })
    }
}
