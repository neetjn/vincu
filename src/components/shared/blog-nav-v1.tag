<blog-nav-v1 class="animated fadeIn">
  <div class="container">
    <div class="row">
      <a class="search-btn-mobile" href="https://vincu.com/blog/search/"><i class="ico fa fa-search"></i></a>
      <a class="nav-btn-mobile" href="#" click={ toggleMobile }><i class="ico fa fa-bars"></i></a>
      <div class="blog-logo-container">
        <a href="https://vincu.com/blog">
          <img class="blog-logo" src="https://s3-us-west-1.amazonaws.com/vincuventas/vincu-blog-logo.png" />
        </a>
      </div>
      <div class="blog-btn-container">
        <a target="_blank" href="https://vincu.com" class="btn btn-lg btn-vincu btn-bolder btn-outline-info">
          Ir a vincu.com <i class="ico ico-right fa fa fa-lg fa-angle-right" style="position: relative; top: -2px;"></i>
        </a>
      </div>
    </div>
    <div class="row">
      <p>La única plataforma de reclutamiento especializada en el área comercial</p>
    </div>
    <div class="row">
      <ul class="categories desktop-menu">
        <li each={ category in categories }>
          <a href={ category.link }>
            { category.name }
          </a>
        </li>
        <li>
          <a class="search-btn" href="https://vincu.com/blog/search/">
            <i class="ico fa fa-search"></i>
          </a>
        </li>
      </ul>
      <ul if={ showMobile } class="categories mobile-menu animated fadeIn">
        <li each={ category in categories }>
          <a href={ category.link }>
            { category.name }
          </a>
        </li>
      </ul>
    </div>
  </div>
  <script>
    const self = this
    self.on('mount', function() {
      self.categories = []
      self.showMobile = false
    })
    fetch('https://vincu.com/wp-json/wp/v2/categories')
      .then(result => result.json().then(categories => {
        self.categories = categories.filter(category => category.id != 1 && category.count > 0)
        self.update()
      }))

    toggleMobile() {
      self.showMobile = !self.showMobile
    }
  </script>
</blog-nav-v1>
