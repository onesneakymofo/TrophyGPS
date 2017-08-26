//= require ../global/map

;(() => {
  let COMPONENT_SELECTOR = '[data-behavior="posts-map"]'

  class PostsMap extends Map {
    constructor() {
      super(L.map('map-large').setView([33.5, -86], 8))
    }

    addPoints(data) {
      data.forEach(post => {
        const icon = greenIcon
        if (
          super.rejectData(post.coordinates.x) ||
          super.rejectData(post.coordinates.y)
        )
          return
        L.marker([post.coordinates.x, post.coordinates.y], {
          icon: icon
        }).addTo(this.map)
      }, this)
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
