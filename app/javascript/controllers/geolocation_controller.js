import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="geolocation"
export default class extends Controller {

  static targets = ['form', 'name', 'lat', 'long']
  static values = {
    userId: Number
  }

  connect() {
    console.log("hello from the geolocation controller")
    console.log(this.formTarget.action)
    console.log(this.latTarget)
    console.log(this.longTarget)
    console.log(this.userIdValue);
    navigator.geolocation.getCurrentPosition((data) => {
     this.latTarget.value = data.coords.latitude
     this.longTarget.value = data.coords.longitude
    });

  }

  postReport(e) {
    e.preventDefault()
      navigator.geolocation.getCurrentPosition((data) => {
        this.coordinatesTarget.innerText = `Latitide: ${data.coords.latitude}, Longitude: ${data.coords.longitude}`;
        fetch(this.formTarget.action, {
          method: "POST",
          headers: { "Content-Type": "application/json" },
          body: JSON.stringify({
            "name": this.nameTarget.value,
            "latitude": data.coords.latitude,
            "longitude": data.coords.longitude,
            "user_id": this.userIdValue
          }),
        })
          .then((res) => res.json())
          .then((data) => {
            console.log(data);
          });
      });

  }
}
// send(event) {
//   event.preventDefault();
//   fetch(this.formTarget.action, {
//     method: "POST", // Could be dynamic with Stimulus values
//     headers: { "Accept": "application/json" },
//     body: new FormData(this.formTarget)
//   })
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data)
//     })
// }
