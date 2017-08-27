//= require ../global/map-new

;(() => {
  let COMPONENT_SELECTOR =
    '[data-behavior="posts-map-new"],[data-behavior="posts-new-image"]'

  class PostsMap extends MapNew {
    constructor() {
      super(
        L.map('map-new-post', { zoomControl: false }).setView([33.5, -86], 8)
      )
    }

    whenMarkerIsDragged(e) {}

    addToMap(x, y) {
      const fixedIcon = redIcon
      const moveableIcon = greenIcon
      if (super.rejectData(x) || super.rejectData(y)) {
        L.marker([33.5, -86], {
          draggable: true,
          bounceOnAdd: true,
          bounceOnAddOptions: { duration: 1500, height: 200 },
          bounceOnAddCallback: function() {
            console.log('done')
          },
          icon: moveableIcon
        })
          .on('move', function(e) {
            // debugger;
            $('#post_coordinates').val(e.latlng.lat + ',' + e.latlng.lng)
          })
          .addTo(this.map)
      } else {
        L.marker([x, y], {
          bounceOnAdd: true,
          bounceOnAddOptions: { duration: 1500, height: 200 },
          bounceOnAddCallback: function() {
            console.log('done')
          },
          icon: fixedIcon
        }).addTo(this.map)
      }
    }

    addPoints(data) {
      if (data.length) {
        data.forEach(post => {
          this.addToMap(post)
        }, this)
      } else {
        this.addToMap(data)
      }
    }
  }

  $(document).on('turbolinks:load', () => {
    const $node = $(COMPONENT_SELECTOR)
    if ($node.length) {
      $.ajaxSetup({ cache: false })
      new PostsMap().init()
    }
  })
})()
