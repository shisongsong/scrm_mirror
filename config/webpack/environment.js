const webpack = require('webpack');
const { environment } = require('@rails/webpacker');
const erb = require('./loaders/erb')

// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend(
    'Provide',
    new webpack.ProvidePlugin({
      $: 'jquery',
      jQuery: 'jquery',
      jquery: 'jquery',
    })
);

// Add an additional plugin of your choosing : IgnorePlugin
environment.plugins.insert(
    'IgnorePlugin',
    new webpack.IgnorePlugin(/^\.\/node_modules/, /turbolinks/, /bootstrap/)
);

// resolve-url-loader must be used before sass-loader
environment.loaders.get('sass').use.splice(-1, 0, {
  loader: 'resolve-url-loader',
  options: {
    attempts: 1
  }
});

environment.loaders.append('erb', erb)
module.exports = environment;
