import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    console.log("heyyyyyyyyyyyyyyyyy")
  }

  updateNavbar() {
    console.log("heyyyyyyyyyyyyyyyyy")
    if (window.scrollY >= window.innerHeight) {
      this.element.classList.add("navbar-lewagon-white")
    } else {
      this.element.classList.remove("navbar-lewagon-white")
    };
  };
}
