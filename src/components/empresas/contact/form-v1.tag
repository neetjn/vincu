<form-v1>
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
            <span class="wpcf7-form-control-wrap your-name">
              <input ref="yourName"
                    name="your-name"
                    type="text"
                    value=""
                    class="form-control wpcf7-form-control wpcf7-text wpcf7-validates-as-required"
                    aria-required="true"
                    aria-invalid="false"
                    required />
            </span>
          </div>
          <div class="form-group">
            <label for="your-email">Correo Electrónico *</label>
            <span class="wpcf7-form-control-wrap your-email">
              <input ref="yourEmail"
                    name="your-email"
                    type="email"
                    value=""
                    class="form-control wpcf7-form-control wpcf7-text wpcf7-validates-as-required"
                    aria-required="true"
                    aria-invalid="false"
                    required />
            </span>
          </div>
          <div class="form-group">
            <label for="form-group">Teléfono *</label>
            <span class="wpcf7-form-control-wrap your-phone">
              <input ref="yourPhone"
                    name="your-phone"
                    type="tel"
                    value=""
                    class="form-control wpcf7-form-control wpcf7-text wpcf7-validates-as-required"
                    aria-required="true"
                    aria-invalid="false" />
            </span>
          </div>
          <div class="form-group">
            <label for="your-message">Mensaje *</label>
            <span class="wpcf7-form-control-wrap your-message">
              <textarea ref="yourMessage"
                        name="your-message"
                        class="form-control wpcf7-form-control wpcf7-text wpcf7-validates-as-required"
                        cols="40"
                        rows="10"
                        aria-invalid="false"
                        required></textarea>
            </span>
          </div>
          <button ref="submitButton" type="submit" class="btn">Enviar</button>
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
      self.refs.submitButton.disabled = true
      const formData = new FormData(self.refs.contactForm)
      fetch('https://vincu.com/wp-json/contact-form-7/v1/contact-forms/1526/feedback', {
        method: 'POST',
        body: formData,
        headers: {
          'Accept': 'application/json, text/javascript, */*; q=0.01'
        }
      }).then(response => {
        if (response.status == 200) {
          response.json().then(data => {
            if (data.status == 'validation_failed') {
              console.error(data)
              throw Error(`Contact form validation failed`)
            }
            else {
              self.requestSent = true
              self.errorNet = false
              self.refs.submitButton.disabled = false
              self.update()
            }
          })
        }
        else {
          throw Error('Unexpected Contact Form Response')
        }
      }).catch(error => {
        self.requestSent = false
        self.errorNet = true
        self.refs.submitButton.disabled = false
        console.error(error)
        self.update()
      })
    }
  </script>
</form-v1>
