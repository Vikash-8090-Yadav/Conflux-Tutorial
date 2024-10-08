const webpack = require('webpack');

module.exports = function override(config) {
    const fallback = config.resolve.fallback || {};
    
    Object.assign(fallback, {
        "crypto": require.resolve("crypto-browserify"),
        "stream": require.resolve("stream-browserify"),
        "assert": require.resolve("assert"),
        "http": require.resolve("stream-http"),
        "https": require.resolve("https-browserify"),
        "os": require.resolve("os-browserify"),
        "url": require.resolve("url"),
        "zlib": require.resolve("browserify-zlib")
        
    })

    config.plugins = (config.plugins || []).concat([
        new webpack.ProvidePlugin({
            process: 'process/browser',
            Buffer: ['buffer', 'Buffer']
        })
    ])
    return config;
}

/* config-overrides.js */
 
// const webpack = require('webpack'); 
// module.exports = function override(config) { 
//     const fallback = config.resolve.fallback || {}; 
//     Object.assign(fallback, { 
//       "crypto": require.resolve("crypto-browserify"), 
//       "stream": require.resolve("stream-browserify"), 
//       "assert": require.resolve("assert"), 
//       "http": require.resolve("stream-http"), 
//       "https": require.resolve("https-browserify"), 
//       "os": require.resolve("os-browserify"), 
//       "url": require.resolve("url") ,
//        "zlib": false ,
//       'process/browser': require.resolve('process/browser')
//       }) 
//    config.resolve.fallback = fallback; 
//    config.plugins = (config.plugins || []).concat([ 
//      new webpack.ProvidePlugin({ 
//       process: 'process/browser', 
//       Buffer: ['buffer', 'Buffer'] 
//     }) 
//    ]) 
//    return config; }