<timeline-v1>
  <div class="row timeline-wrapper">
    <div class="timeline-accessories">
      <h1 class="vincu-title-lite animated slideInDown">¡Vincu hace el trabajo por ti!</h1>
      <ul class="timeline-steps">
        <li>
          <span class="timeline-bubble">
            <i class="ico vincu-icon vincu-crearOferta"></i>
          </span>
        </li>
        <li>
          <span class="timeline-bubble timeline-bubble-focus">
            <i class="ico vincu-icon vincu-email"></i>
          </span>
        </li>
        <li>
          <span class="timeline-bubble">
            <i class="ico vincu-icon vincu-checked" style="font-size: 16px; top: 15px; right: 2.5px;"></i>
          </span>
        </li>
      </ul>
    </div>
    <div class="col-sm-6 container" id="candidateList">
      <h1 class="vincu-title vincu-sub-cursive">
        <small>si eres un…</small><br/>
        Candidato
      </h1>
      <ul class="timeline-list">
        <li>
          <p>
            <strong>Crea tu Hoja de vida gratis</strong> enfocada en tu experiencia en el area comercial.
          </p>
        </li>
        <li class="timeline-focused-item">
          <p>
            <strong>Vincu revisa por ti todas las ofertas</strong> publicadas y te invita a aplicar a las mejores según tu perfil.
          </p>
        </li>
        <li>
          <p>
            <strong>Conoce el estado de cada una de las ofertas</strong> que aplicaste  y conoce si tu Hoja de vida fue:
          </p>
          <ul class="timeline-list-info-classifications">
            <li>
              <i class="vincu-icon vincu-freelance"></i><br />
              <label>Los más recomendados</label>
            </li>
            <li>
              <i class="vincu-icon vincu-leido"></i><br />
              <label>Pendientes<br /> por aplicar</label>
            </li>
            <li>
              <i class="vincu-icon vincu-meGusta"></i><br />
              <label>Pendientes<br /> por aplicar</label>
            </li>
            <li>
              <i class="vincu-icon vincu-noMeGusta"></i><br />
              <label>No ajusta<br /> al perfil</label>
            </li>
          </ul>
        </li>
      </ul>
      <div class="device-image-container animated slideInLeft" id="deviceMobile"></div>
    </div>
    <div class="col-sm-6 container" id="companyList">
      <h1 class="vincu-title vincu-sub-cursive">
        <small>si eres una…</small><br/>
        Empresa
      </h1>
      <ul class="timeline-list">
        <li>
          <p>
            <strong>Publica tus ofertas</strong> en Vincu
          </p>
        </li>
        <li class="timeline-focused-item">
          <p>
            <strong>Vincu revisa por ti todas las Hojas de vida</strong> que recibas y busca en su base de datos los mejores perfiles para invitarlos a aplicar a tu oferta.
          </p>
        </li>
        <li>
          <p>
            <strong>Preclasificamos</strong> y te presentamos los candidatos de la manera más eficiente para que lleves el seguimiento de cada uno de ellos
          </p>
          <ul class="list-unstyled list-inline">
            <ul class="timeline-list-info-classifications">
              <li>
                <i class="vincu-icon vincu-recomendados" style="color: #fed51d;"></i><br />
                <label>Los más recomendados</label>
              </li>
              <li>
                <i class="vincu-icon vincu-porAplicar"></i><br />
                <label>Pendientes<br /> por aplicar</label>
              </li>
              <li>
                <i class="vincu-icon vincu-noAjustan"></i><br />
                <label>No ajusta<br /> al perfil</label>
              </li>
            </ul>
          </ul>
        </li>
      </ul>
      <div class="device-image-container animated slideInRight" id="deviceLaptop"></div>
      <!-- https://s3-us-west-1.amazonaws.com/vincuventas/vincu-laptop.png -->
    </div>
  </div>
  <script>
    import anime from 'animejs'

    const self = this

    console.log(anime)

    self.on('mount', () => {
      /**
       * Animate timeline bubbles in succession.
       * Assumes each animation will take no longer than 2000 ms / 2s.
       * Will return a promise which will be resolved when the animations are finished for all items.
       */
      function animateBubbles() {
        const scaleDuration = 1000;
        const scaleDelay = 250;
        return new Promise((resolve, reject) => {
          const timelineBubbles = document.querySelectorAll('ul.timeline-steps li')
          timelineBubbles.forEach((node, index) => {
            setTimeout(() => {
              anime({
                targets: node,
                scale: [
                  {
                    value: 0,
                    duration: scaleDuration,
                    easing: 'easeInElastic'
                  },
                  {
                    value: 1,
                    duration: scaleDuration,
                    easing: 'easeInElastic'
                  }
                ],
                complete: () => {
                  if (index === timelineBubbles.length - 1) {
                    resolve()
                  }
                }
              })
            }, index * ( scaleDuration * 2 ) + scaleDelay)
          })
        })
      }
      animateBubbles().then(() => setTimeout(() => {
        animateBubbles()
      }), 2500)
    })
  </script>
</timeline-v1>
