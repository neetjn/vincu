
const fs = require('fs')
const aws = require('aws-sdk')
const uuidv4 = require('uuid/v4')

/**
 * Upload compiled bundle to s3.
 * @param {Object} config - Configuration settings.
 * @param {String} bundlePath - Path of compiled bundle to upload.
 * @param {String} classifier - Container classifier.
 * @param {String} container - Container nae.
 * @returns {Promise}
 */
module.exports = function(config, bundlePath, classifier, container) {
  // # fetch bundle source
  console.log('Fetching bundle source...')
  const bundle = fs.readFileSync(bundlePath).toString('utf8')
  // # setup aws clients
  aws.config.update(config)
  s3 = new aws.S3()
  var params = {
    Bucket: config.s3Bucket,
    Key: `${ classifier }-${ container }-${uuidv4().toString('utf8')}.js`,
    Body: bundle,
    ACL: 'public-read'
  }
  var options = { partSize: 10 * 1024 * 1024, queueSize: 1 }
  // # upload component to s3 and return object href
  console.log('Uploading bundle...')
  return new Promise((resolve, reject) => {
    s3.upload(params, options, (error, data) => {
      if (error) {
        console.log(`An error occurred during upload: ${error}`)
        reject(error)
      } else {
        console.log(`Upload successful, bundle href: ${data.Location}`)
        resolve(data.Location)
      }
    })
  })
}
