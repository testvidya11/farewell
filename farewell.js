var fs = require('fs');

var key = 'i hope in the next ten years there would be no other farewell letter brilliant than this one';

fs.readFile(process.argv[2], function (err, data) {
  var encrypted = data.toString().replace(/\s/g, '').split(',');
  var decrypted = []
  for (var i = 0; i < encrypted.length; ++i) {
    decrypted.push(String.fromCharCode(parseInt(encrypted[i]) ^ key.charCodeAt(i % key.length)));
  }
  process.stdout.write(decrypted.join(''));
});
