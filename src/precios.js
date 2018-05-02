import './assets/styles/_precios.scss'

import './components/shared/'
import './components/precios/'
import './components/precios.tag'

import riot from 'riot'

try {
  document.querySelector('#thb-app-css').disabled = true
  document.querySelector('#vincu-style-css').disabled = true
  document.querySelector('#style-css').disabled = true
  document.querySelector('#wrapper').outerHTML = '<precios />'
} catch(e) {
  console.log('Skipping Vincu Wordpress Cleanup')
}

riot.mount('precios')
