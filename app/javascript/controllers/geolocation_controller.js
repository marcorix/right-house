import { Controller } from "@hotwired/stimulus"

 const options = {
   enableHighAccuracy: true,
   timeout: 5000,
   maximumAge: 0,
 };

 let latitude = ""
 let longitude = ""

// Connects to data-controller="geolocation"
export default class extends Controller {

  static targets = ['name']

  connect() {
    console.log("hello from the geolocation controller")
    console.log(this.nameTarget)
    navigator.geolocation.getCurrentPosition(this.success, this.error, options);
  }


  success(pos) {
    const crd = pos.coords;
    console.log("Your current position is:");
    console.log(`Latitude : ${crd.latitude}`);
    console.log(`Longitude: ${crd.longitude}`);
    console.log(`More or less ${crd.accuracy} meters.`);
    latitude = crd.latitude;
    longitude = crd.longitude;
  }

  error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  }

  // postReport(e) {
  //   e.preventDefault()

  //   fetch(this.element.action, {
  //     method: "POST",
  //     headers: { "Content-Type": "application/json" },
  //     body: JSON.stringify({name: this.nameTarget.value, latitude: latitude, longitude: longitude}),
  //   })
  //     .then((res) => res.json())
  //     .then((data) => {
  //       console.log(data);
  //     });
  // }
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
