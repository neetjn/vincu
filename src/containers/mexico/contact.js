import './assets/styles/_contact.scss'

import './components/shared/'
import './components/contact/'
import './components/contact.tag'

import riot from 'riot'

try {
  document.querySelector('#thb-app-css').disabled = true
  document.querySelector('#vincu-style-css').disabled = true
  document.querySelector('#style-css').disabled = true
  document.querySelector('#wrapper').outerHTML = '<contact />'
} catch(e) {
  console.log('Skipping Vincu Wordpress Cleanup')
}

riot.mount('contact')
