const database = require('./database');
const express = require('express');
const client = require('redis');

(async () => {
    const redis = client.createClient();
    redis.on('error', (err) => console.log('Redis Client Error', err));
    await redis.connect();
    await redis.ping();
})();

const app = express();

app.get('/nocache/index.html', (req, res) => {
    database.get('index.html', page => {
        res.send(page);
    });
});

app.get('/withcache/index.html', (req, res) => {
    redis.get('index.html', (err, redisRes) => {
        if(redisRes){
            res.send(redisRes);
            return;
        }

        
        database.get('index.html', page => {
            redis.set('index.html', page, 'EX', 10);
            res.send(page);
        });
    });
});

app.listen(3001, () => {
    console.log('listening on http://localhost:3001');
})