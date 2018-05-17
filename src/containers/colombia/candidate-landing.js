import '@/assets/styles/containers/colombia/_candidate-landing.scss'
import '@/components/colombia/candidate-landing/banner-v1.tag'
import '@/components/colombia/candidate-landing/blog-v1.tag'
import '@/components/colombia/candidate-landing/countries-v1.tag'
import '@/components/colombia/candidate-landing/testimonials-v1.tag'
import '@/components/colombia/candidate-landing/timeline-v1.tag'
import '@/components/shared/footer-co-v1.tag'
import '@/components/shared/nav-v1.tag'
import './candidate-landing.tag'

import riot from 'riot'

try {
  document.querySelector('#thb-app-css').disabled = true
  document.querySelector('#vincu-style-css').disabled = true
} catch(e) {
  console.log('Skipping Vincu Wordpress Cleanup')
}

riot.mount('candidate-landing')
