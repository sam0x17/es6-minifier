var Terser = require('terser');
var fs = require('fs');

process.argv.forEach(function(path) {
  if(path != "/snapshot/js/minify.js" && path.endsWith(".js")) {
    var options = { mangle: false }
    var data = fs.readFileSync(path, 'utf8').toString();
    var result = Terser.minify(data, options);
    if(result.error) throw result.error;
    console.log('minified ' + path);
    fs.writeFileSync(path, result.code);
  }
});
