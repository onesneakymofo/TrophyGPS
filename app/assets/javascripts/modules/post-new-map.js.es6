//= require ../global/map-new

;(() => {
  let COMPONENT_SELECTOR = '[data-behavior="posts-map-new"]'

  class PostsMap extends MapNew {
    constructor() {
      super(L.map('map-new-post').setView([33.5, -86], 8))
    }

    addToMap(x,y) {
      const icon = greenIcon
      if (
        super.rejectData(x) ||
        super.rejectData(y)
      )
        return
      L.marker([x, y], {
        bounceOnAdd: true,
        bounceOnAddOptions: {duration: 1500, height: 200},
        bounceOnAddCallback: function() {console.log("done");},
        icon: icon
      }).addTo(this.map)
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
