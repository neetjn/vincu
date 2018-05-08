import '@/assets/styles/containers/mexico/_precios.scss'
import '@/components/mexico/precios/plans-v1.tag'
import '@/components/shared/footer-v1.tag'
import './precios.tag'

import riot from 'riot'

try {
  document.querySelector('#thb-app-css').disabled = true
  document.querySelector('#vincu-style-css').disabled = true
} catch(e) {
  console.log('Skipping Vincu Wordpress Cleanup')
}

riot.mount('precios')
