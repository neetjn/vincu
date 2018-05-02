import './assets/styles/_company-landing.scss'

import './components/shared/'
import './components/company-landing/'
import './components/company-landing.tag'

import riot from 'riot'
import 'riot-animore'

try {
  document.querySelector('#thb-app-css').disabled = true
  document.querySelector('#vincu-style-css').disabled = true
  document.querySelector('#style-css').disabled = true
  document.querySelector('#wrapper').outerHTML = '<company-landing />'
} catch(e) {
  console.log('Skipping Vincu Wordpress Cleanup')
}

riot.mount('company-landing')
