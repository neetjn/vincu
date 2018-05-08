import '@/assets/styles/containers/mexico/_company-landing.scss'
import '@/components/mexico/company-landing/about-v1.tag'
import '@/components/mexico/company-landing/banner-v1.tag'
import '@/components/mexico/company-landing/blog-v1.tag'
import '@/components/mexico/company-landing/countries-v1.tag'
import '@/components/mexico/company-landing/footer-v1.tag'
import '@/components/mexico/company-landing/jobs-v1.tag'
import '@/components/mexico/company-landing/plans-v1.tag'
import '@/components/mexico/company-landing/timeline-v1.tag'
import '@/components/shared/footer-v1.tag'
import './company-landing.tag'

import riot from 'riot'
import 'riot-animore'

try {
  document.querySelector('#thb-app-css').disabled = true
  document.querySelector('#vincu-style-css').disabled = true
} catch(e) {
  console.log('Skipping Vincu Wordpress Cleanup')
}

riot.mount('company-landing')
