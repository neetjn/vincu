import '@/assets/styles/containers/colombia/_precios.scss'
import '@/components/colombia/precios/plans-v1.tag'
import '@/components/shared/footer-co-v1.tag'
import './precios.tag'

import riot from 'riot'

try {
  document.querySelector('#thb-app-css').disabled = true
  document.querySelector('#vincu-style-css').disabled = true
} catch(e) {
  console.log('Skipping Vincu Wordpress Cleanup')
}

riot.mount('precios')
