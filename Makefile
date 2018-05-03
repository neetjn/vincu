bundle:
	node scripts/build.js --upload --classifier=${classifier} --container=${container}
serve:
	./node_modules/.bin/webpack-dev-server --config webpack.config.js --entry="./src/containers/${classifier}/${container}.js" --port 3000 --host 0.0.0.0