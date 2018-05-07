import '@/assets/styles/containers/colombia/_contact-candidatos.scss'
import '@/components/colombia/contact-candidatos/banner-v1.tag'
import '@/components/colombia/contact-candidatos/form-v2.tag'
import './contact-candidatos.tag'

import riot from 'riot'

try {
  document.querySelector('#thb-app-css').disabled = true
  document.querySelector('#vincu-style-css').disabled = true
  document.querySelector('#style-css').disabled = true
  document.querySelector('#wrapper').outerHTML = '<contact />'
} catch(e) {
  console.log('Skipping Vincu Wordpress Cleanup')
}

riot.mount('contact-candidatos')
