const path = require('path')
const webpack = require('webpack')
const webpackConfig = require('../webpack.config')

const ARGUMENTS = {
  CLASSIFIER: '--classifier',
  CONTAINER: '--container'
}

var classifier = null
var container = null

process.argv.forEach(function (val) {
  if (val == ARGUMENTS.CLASSIFIER) {
    console.log(`Classifier "${ val }" specified.`)
    classifier = val
  }
  if (val == ARGUMENTS.CONTAINER) {
    console.log(`Container "${ val }" specified.`)
    container = val
  }
})

if (!classifier || !container) {
  console.log('A classifier and container must be specified.')
  process.exit()
}

webpackConfig.entry = `./src/containers/mexico/contact.js`

webpack(webpackConfig, (error, status) => {
  if (error || status.hasErrors()) {
    console.log('An error has occurred while building bundle.')
    console.log(`Error: ${ error }`)
  } else {
    console.log('Bundle built successfully!')
  }
})
