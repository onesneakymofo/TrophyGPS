//= require ../global/map

;(() => {
  let COMPONENT_SELECTOR = '[data-behavior="posts-map"]'

  class PostsMap extends Map {
    constructor() {
      super(L.map('map-large', { zoomControl: false }).setView([33.5, -86], 8))
    }

    addToMap(post) {
      const icon = greenIcon

      if (
        super.rejectData(post.coordinates.x) ||
        super.rejectData(post.coordinates.y)
      )
        return
      var marker = new L.marker([post.coordinates.x, post.coordinates.y], {
        icon: icon
      });
      marker.url = post.url
      marker.addTo(this.map);
      marker.on('click', function(){
        window.location = (this.url);
      });    }


    addPoints(data) {
      if (data.length) {
        data.forEach(post => {
          if ((typeof post.coordinates.x !== 'undefined') && (typeof post.coordinates.x !== 'undefined')) {
            this.addToMap(post)
            }
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
