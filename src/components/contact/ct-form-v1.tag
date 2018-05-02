<ct-form-v1>
  <div class="container">
    <div class="row">
      <div class="col-md-6 col-sm-6 col-xs-12">
        <div if={ requestSent } class="alert alert-success animated fadeIn" role="alert">
          <strong>¡Tu mensaje ha sido recibido!</strong>
        </div>
        <div if={ errorNet } class="alert alert-danger animated fadeIn" role="alert">
          <strong>Se produjo un problema al enviar su solicitud. Por favor, póngase en contacto con un administrador.</strong>
        </div>
        <form ref="contactForm" onsubmit={ contactRequest }>
          <!-- https://vincu.com/mx/empresas/contacto/#wpcf7-f1526-p1524-o1 -->
          <div style="display: none;">
            <input type="hidden" name="_wpcf7" value="1526">
            <input type="hidden" name="_wpcf7_version" value="5.0.1">
            <input type="hidden" name="_wpcf7_locale" value="es_CO">
            <input type="hidden" name="_wpcf7_unit_tag" value="wpcf7-f1526-p1524-o1">
            <input type="hidden" name="_wpcf7_container_post" value="1524">
          </div>
          <div class="form-group">
            <label for="your-name">Nombre *</label>
            <input ref="yourName"
                   name="your-name"
                   type="text"
                   value=""
                   class="form-control"
                   aria-required="true"
                   aria-invalid="false"
                   required />
          </div>
          <div class="form-group">
            <label for="your-email">Correo Electrónico *</label>
            <input ref="yourEmail"
                   name="your-email"
                   type="email"
                   value=""
                   class="form-control"
                   aria-required="true"
                   aria-invalid="false"
                   required />
          </div>
          <div class="form-group">
            <label for="form-group">Teléfono *</label>
            <input ref="yourPhone"
                   name="your-phone"
                   type="tel"
                   value=""
                   class="form-control"
                   aria-required="true"
                   aria-invalid="false" />
          </div>
          <div class="form-group">
            <label for="your-message">Mensaje *</label>
            <textarea ref="yourMessage"
                      name="your-message"
                      class="form-control"
                      cols="40"
                      rows="10"
                      aria-invalid="false"
                      required></textarea>
          </div>
          <button type="submit" class="btn">Enviar</button>
        </form>
      </div>
      <div class="col-md-6 col-sm-6 col-xs-12">
        <div class="contact-info-container">
          <ul>
            <li>
              <span class="contact-icon"><i class="ico fa fa-envelope"></i></span><br/>
              <h1>Correo<br />Electrónico</h1><br />
              <a href="mailto:soporte@vincuventas.com">soporte@vincuventas.com</a>
            </li>
            <li>
              <span class="contact-icon"><i class="ico fa fa-phone"></i></span><br/>
              <h1>Teléfonos</h1><br />
              <a href="tel:(322) 345 8361 - 749 5845">(322) 345 8361 - 749 5845</a>
            </li>
            <li>
              <span class="contact-icon"><i class="ico fa fa-map-marker"></i></span><br/>
              <h1>Dirección</h1><br />
              Calle 71 #13-66, Bogotá - Colombia
            </li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <script>
    const self = this

    this.on('mount', function() {
      this.errorNet = false
      this.requestSent = false
    })

    contactRequest(e) {
      e.preventDefault()
      const form = new FormData(self.refs.contactForm)
      fetch('https://vincu.com/wp-json/contact-form-7/v1/contact-forms/1526/feedback', {
        method: 'POST',
        body: form,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded'
        }
      }).then(response => {
        if (response.status == 200) {
          self.requestSent = true
          self.errorNet = false
        }
        else
          throw Error('Unexpected Contact Form Response')
        self.update()
      }).catch(error => {
        self.requestSent = false
        self.errorNet = true
        self.update()
      })
    }
  </script>
</ct-form-v1>
