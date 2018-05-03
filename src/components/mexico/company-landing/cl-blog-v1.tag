<cl-blog-v1>
  <div class="container">
    <h1 class="vincu-title-large">
      <small>Mantente</small>
      <br /> Informado
    </h1>
  <p class="vincu-sub-title vincu-header">En nuestro blog encontrarás todo para mantenerte actualizado, noticias, estrategias, tácticas y consejos de ventas y
      reclutamiento.</p>
    <h1 class="text-center animated fadeIn"
        if={ !posts.length }
        style="margin: 4rem;">
      <i class="fa fa-2x fa-spinner fa-spin"></i></h1>
    <div class="row">
      <div class="col-md-4 col-sm-4 animated fadeIn" each={ post in posts }>
        <div class="thumbnail">
          <a href={ post.link }>
            <img src={ post.media } alt={ post.title }>
          </a>
          <div class="body">
            <div class="citation">
              <p>
                <strong style="text-transform: uppercase;">{ post.posted }</strong>
              </p>
              <p>
                <!-- { post.author } -->
                Consejos, Estrategia de Ventas
              </p>
            </div>
            <div class="caption">
              <a href={ post.link }>
                <h4 class="vincu-title-lite">{ post.title }</h4>
              </a>
              <p class="content">{ post.content }</p>
              <p>
                <a class="read-more" href={ post.link }>Leer más</a>
              </p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script>
    const self = this
    self.posts = []
    self.on('mount', function() {
      fetch('https://blog.vincuventas.com/wp-json/wp/v2/posts?_embed')
        .then(response => {
          response.json()
            .then(data => {
              // # get latest 3 posts
              const dateFormat = 'es-CO'
              const dateOptions = { year: 'numeric', month: 'short', day: 'numeric' }
              const contentSize = 150
              const htmlRegex = /(<([^>]+)>)/ig
              self.posts = data.slice(0, 3).map(post => {
                const postContent = post.content.rendered.replace(htmlRegex, '')
                return {
                  posted: new Date(post.date).toLocaleString(dateFormat, dateOptions),
                  link: decodeURI(post.link),
                  title: decodeURI(post.title.rendered),
                  content: postContent.length > contentSize ? postContent.slice(0, 150) + '...' : postContent,
                  author: post._embedded.author[0].name,
                  media: decodeURI(post._embedded['wp:featuredmedia'][0].media_details.sizes.large.source_url)
                }
              })
              self.update()
            })
        })
    })
  </script>
</cl-blog-v1>
