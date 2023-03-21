const cron = require('node-cron');
const ticker = require('./tasks/sync-db');

console.log('start:');

cron.schedule(`1-59/2 * * * * *`, ticker);
