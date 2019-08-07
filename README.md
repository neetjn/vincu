# Vincu

Vincu @ https://vincu.com

## About

This project was created for rapid prototyping of different designs during my time at Vincu. Each SPA is powered by Riot.js 3 and using Sass for styling.

## Setting Up

This project was created using node version `10.x` and npm `6`.

Use `npm install` to install all necessary dependencies.

To build and upload a bundle to aws s3 use the command:
```sh
make bundle classifier=mexico container=contact
```

To serve a container for local testing, use:
```sh
make serve classifier=mexico container=contact`
```

---

Copyright (c) 2018 - present John Nolette, Vincu Licensed under the MIT License.
