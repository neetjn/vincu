import '@/assets/styles/containers/colombia/_company-landing.scss'
import '@/components/colombia/company-landing/about-v1.tag'
import '@/components/colombia/company-landing/banner-v1.tag'
import '@/components/colombia/company-landing/blog-v1.tag'
import '@/components/colombia/company-landing/countries-v1.tag'
import '@/components/colombia/company-landing/footer-v1.tag'
import '@/components/colombia/company-landing/jobs-v1.tag'
import '@/components/colombia/company-landing/plans-v1.tag'
import '@/components/colombia/company-landing/timeline-v1.tag'
import '@/components/shared/footer-v1.tag'
import '@/components/shared/nav-v1.tag'
import './company-landing.tag'

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
