class Map {
  constructor(map) {
    this.map = map
    this.dataUrl = window.location.href
  }

  init() {
    this.setupIcons()
    this.setupMap()
    this.fetchDataPoints()
  }

  setupMap() {
    L.tileLayer(
      'http://{s}.{base}.maps.cit.api.here.com/maptile/2.1/{type}/{mapID}/hybrid.day/{z}/{x}/{y}/{size}/{format}?app_id={app_id}&app_code={app_code}&lg={language}',
      {
        attribution:
          'Map &copy; 1987-2014 <a href="http://developer.here.com">HERE</a>',
        subdomains: '1234',
        mapID: 'newest',
        app_id: 'I8Ag6z3GVBMzt6491VcG',
        app_code: 'Yk2uH8wzG2f4ZOI5QTTCvQ',
        base: 'aerial',
        maxZoom: 20,
        type: 'maptile',
        language: 'eng',
        format: 'png8',
        size: '256'
      }
    ).addTo(this.map)
    new L.Control.Zoom({ position: 'topright' }).addTo(this.map)
  }

  fetchDataPoints() {
    $.getJSON(this.dataUrl).done(data => {
      this.addPoints(data)
    })
  }

  setupIcons() {
    const contexts = ['green', 'red']

    contexts.map(context => {
      window[`${context}Icon`] = new L.Icon({
        iconUrl: `https://cdn.rawgit.com/pointhi/leaflet-color-markers/master/img/marker-icon-2x-${context}.png`,
        shadowUrl:
          'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
        iconSize: [25, 41],
        iconAnchor: [12, 41],
        popupAnchor: [1, -34],
        shadowSize: [41, 41]
      })
    })
  }

  rejectData(point_value) {
    if (point_value == null || point_value == 0) return true
    false
  }

  setIconColor(status) {
    status === 'passed' ? greenIcon : redIcon
  }
}
