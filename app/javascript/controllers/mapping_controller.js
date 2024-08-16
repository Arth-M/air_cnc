import { Controller } from "@hotwired/stimulus"
import mapboxgl from "mapbox-gl"
// Connects to data-controller="mapping"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = "pk.eyJ1IjoiYm9vYnljb2RpZXBpZSIsImEiOiJjbHpzc2ZoMnUxcWMxMmxzOHJiYTI1cG1uIn0.ELKOwv8JnV5apyirkL4jnA"
    console.log(this.markersValue)
    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const customMarker = document.createElement("div")
      customMarker.innerHTML = marker.marker_html
      new mapboxgl.Marker(customMarker)
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(this.map)
    })
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 13.5, duration: 100 })
  }
}
