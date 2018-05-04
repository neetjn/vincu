<countries-v1>
  <div class="container text-center">
    <h1 class="vincu-title">Nosotros te ayudamos</h1>
    <h4 class="vincu-title-lite vincu-header">¡Disminuimos tu tiempo en el proceso de reclutamiento!</h4>
    <div class="company-container">
      <div class="company-container-title-wrapper">
        <h4 class="company-container-title">Estas empresas contratan con Vincu</h4>
      </div>
      <div class="row company-list">
        <div each={ company in companies } class="col-md-2 col-sm-2 col-xs-6">
          <a href={ company.href }></a>
            <img src={ company.img } title={ company.name } />
          </a>
        </div>
      </div>
    </div>
  </div>
  <div class="country-wrapper">
    <div class="row">
      <div class="col-md-4 col-sm-4 col-xs-12">
        <div class="row country-count-container">
          <div class="col-md-6 col-sm-6 col-xs-3 text-right">
            <h1 class="country-count vincu-title">2</h1>
          </div>
          <div class="col-md-6 col-sm-6 col-xs-6 text-left">
            <h2 class="country-list">
              Países:<br />
              Colombia, México
            </h2>
          </div>
        </div>
      </div>
      <div class="col-md-4 col-sm-4 col-xs-6">
        <div id="candidatos" class="country-stat-container">
          <h1 class="vincu-title">+452,000</h1>
          <h4>candidatos</h4>
        </div>
      </div>
      <div class="col-md-4 col-sm-4 col-xs-6">
        <div id="empresas" class="country-stat-container">
          <h1 class="vincu-title">+8,300</h1>
          <h4>empresas</h4>
        </div>
      </div>
    </div>
  </div>
  <script>
    this.companies = [
      {
        name: 'Collective Academy',
        href: 'https://collectiveacademy.co/',
        img: 'https://s3-us-west-1.amazonaws.com/vincuventas/logo_collective-academy.png'
      },
      {
        name: 'Loreal',
        href: 'http://www.loreal.com/',
        img: 'https://s3-us-west-1.amazonaws.com/vincuventas/logo_loreal.png'
      },
      {
        name: 'Allianz',
        href: 'https://www.allianz.co/',
        img: 'https://s3-us-west-1.amazonaws.com/vincuventas/logo_allianz.png'
      },
      {
        name: 'Mapfre',
        href: 'https://www.mapfre.com.co/',
        img: 'https://s3-us-west-1.amazonaws.com/vincuventas/logo_mapfre.png'
      },
      {
        name: 'BBVA',
        href: 'https://www.bbva.com.co/',
        img: 'https://s3-us-west-1.amazonaws.com/vincuventas/logo_BBVA.png'
      },
      {
        name: 'OFI',
        href: 'https://ofi.com.mx/',
        img: 'https://s3-us-west-1.amazonaws.com/vincuventas/logo_ofi.png'
      }
    ]
  </script>
</countries-v1>
