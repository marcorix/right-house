import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="insert-in-list"
export default class extends Controller {
  static targets = ["items", "form"]

  connect() {
    console.log("hello from inlist cotroller")
    // console.log(this.element);
    // console.log(this.itemsTarget);
    // console.log(this.formTarget);
  }

  send(event) {

    // console.log(new FormData(this.formTarget));
    event.preventDefault();
    fetch(this.formTarget.action, {
      method: "POST",
      headers: { Accept: "application/json" },
      body: new FormData(this.formTarget),
    })
    .then(res => res.json())
    .then((data) => {
      if (data.inserted_item) {
        this.itemsTarget.insertAdjacentHTML("afterbegin", data.inserted_item);
      }
      this.formTarget.outerHTML = data.form;
    })
    ;
  }
}
