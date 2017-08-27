class MapNew {
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
      'http://server.arcgisonline.com/ArcGIS/rest/services/Ocean_Basemap/MapServer/tile/{z}/{y}/{x}',
      {
        attribution: ''
      }
    ).addTo(this.map)
  }

  fetchDataPoints() {
    this.addToMap($("#coordinates").data('latitude'),
                  $("#coordinates").data('longitude'));
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
