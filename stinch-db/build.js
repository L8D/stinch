var generate = require('sql-generate');

generate({
    dsn: process.env.DATABASE_URL,
    outputFile: __dirname + '/dist/definitions.js',
    schema: 'stinch',
    includeSchema: true
}, function(err, stats) {
    if (err) throw err;

    process.exit(err ? 1 : 0);
});
