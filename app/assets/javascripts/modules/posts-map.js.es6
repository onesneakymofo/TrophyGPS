//= require ../global/map

;(() => {
  let COMPONENT_SELECTOR = '[data-behavior="posts-map"]'

  class PostsMap extends Map {
    constructor() {
      super(L.map('map-large').setView([10, 0], 2))
    }

    // addPoints(data) {
    //   data.forEach(post => {
    //     // const icon = post.status === 'passed' ? greenIcon : redIcon
    //     post.locations.forEach(location => {
    //       if (
    //         super.rejectData(location.latitude) ||
    //         super.rejectData(location.longitude)
    //       )
    //         return
    //       L.marker([location.latitude, location.longitude], { icon: icon }).addTo(
    //         this.map
    //       )
    //     }, this)
    //   })
    // }
  }

  $(document).on('turbolinks:load', () => {
    const $node = $(COMPONENT_SELECTOR)
    if ($node.length) {
      $.ajaxSetup({ cache: false })
      new PostsMap().init()
    }
  })
})()
