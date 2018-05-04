import '@/assets/styles/containers/mexico/_contact-empresas.scss'
import '@/components/mexico/contact-empresas/banner-v1.tag'
import '@/components/mexico/contact-empresas/form-v1.tag'
import './contact-empresas.tag'

import riot from 'riot'

try {
  document.querySelector('#thb-app-css').disabled = true
  document.querySelector('#vincu-style-css').disabled = true
  document.querySelector('#style-css').disabled = true
  document.querySelector('#wrapper').outerHTML = '<contact />'
} catch(e) {
  console.log('Skipping Vincu Wordpress Cleanup')
}

riot.mount('contact-empresas')
