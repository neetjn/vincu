const path = require('path')
const uploadBundle = require('./lib/upload')
const webpack = require('webpack')
const webpackConfig = require('../webpack.config')

const ARGUMENTS = {
  CLASSIFIER: '--classifier',
  CONTAINER: '--container',
  UPLOAD: '--upload'
}

var classifier = null
var container = null
var upload = false

process.argv.forEach(function (param) {
  console.log(param)
  if (param.startsWith(ARGUMENTS.CLASSIFIER)) {
    param = param.split('=')[1]
    console.log(`Classifier "${ param }" specified.`)
    classifier = param
  }
  if (param.startsWith(ARGUMENTS.CONTAINER)) {
    param = param.split('=')[1]
    console.log(`Container "${ param }" specified.`)
    container = param
  }
  if (param == ARGUMENTS.UPLOAD) {
    upload = true
  }
})

if (!classifier || !container) {
  console.log('A classifier and container must be specified.')
  process.exit()
}

webpackConfig.entry = `./src/containers/${ classifier }/${ container }.js`

webpack(webpackConfig, (error, status) => {
  if (error || status.hasErrors()) {
    console.log('An error has occurred while building bundle.')
    console.log(`Error:\n${ status }`)
  } else {
    console.log('Bundle built successfully!')
    console.log(`Build Status:\n${ status }`)
    if (upload) {
      const awsConfig = require('../aws.config.json')
      const bundlePath = `${ webpackConfig.output.path }/${ webpackConfig.output.filename }`
      uploadBundle(awsConfig, bundlePath, classifier, container)
    }
  }
})
