<form-v2>
  <div class="container">
    <div class="row">
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
          <label for="form-group">Asunto *</label>
          <span class="wpcf7-form-control-wrap your-question">
            <select ref="yourQuestion"
                    name="your-question"
                    class="form-control"
                    aria-required="true"
                    aria-invalid="false"
                    onchange={ autoComplete }>
              <option disabled selected></option>
              <option value="¿Qué es VincuVentas?">¿Qué es VincuVentas?</option>
              <option value="¿Cómo aplico a ofertas laborales?">¿Cómo aplico a ofertas laborales?</option>
              <option value="¿Cómo me contactan las empresas?">¿Cómo me contactan las empresas?</option>
              <option value="Otra">Otra</option>
            </select>
          </span>
        </div>
        <div class="form-group animated fadeIn" if={ customQuestion }>
          <label for="your-custom-question">Especificar Asunto</label>
          <span class="wpcf7-form-control-wrap your-custom-question">
            <input ref="yourCustomQuestion"
                    name="your-custom-question"
                    type="text"
                    value=""
                    class="form-control wpcf7-form-control wpcf7-text wpcf7-validates-as-required"
                    aria-required="true"
                    aria-invalid="false"
                    required />
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
  </div>
  <script>
    const self = this

    this.on('mount', function() {
      this.errorNet = false
      this.requestSent = false
      self.customQuestion = false
    })

    contactRequest(e) {
      e.preventDefault()
      self.refs.submitButton.disabled = true
      const formData = new FormData(self.refs.contactForm)
      fetch('https://vincu.com/wp-json/contact-form-7/v1/contact-forms/1631/feedback', {
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

    autoComplete(e) {
      switch(e.target.value) {
        case '¿Qué es VincuVentas?':
          self.customQuestion = false
          self.refs.yourMessage.textContent = 'Somos la única plataforma de reclutamiento online especializada en el área comercial. Te ofrecemos la oportunidad de exponerte eficientemente ante las empresas. Nos encargamos de poner en contacto o facilitar el encuentro entre las personas interesadas en el área comercial y las empresas que requieren de estos servicios. No somos una temporal.'
          break
        case '¿Cómo aplico a ofertas laborales?':
          self.customQuestion = false
          self.refs.yourMessage.textContent = 'En VincuVentas, puedes aplicar a ofertas directamente en nuestro portal de empleo, al igual las empresas aplicarán constantemente a tu perfil, por lo cual en tu inbox encontrarás solicitudes de aplicación para contarte de ofertas laborales.'
          break
        case '¿Cómo me contactan las empresas?':
          self.customQuestion = false
          self.refs.yourMessage.textContent = 'Una vez aplicas a una oferta directamente en el portal o a través de alguno de nuestros correos, tu perfil será revisado para validar el cumplimiento de requisitos. Luego de esto la empresa recibirá tu perfil y podrá ponerse en contacto directamente.'
          break
        case 'Otra':
          self.customQuestion = true
          self.refs.yourMessage.textContent = ''
          break
      }
    }
  </script>
</form-v2>
