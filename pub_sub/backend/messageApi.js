const webSocket = require('ws');
const axios = require('axios');

function publish(message, topicId) {
    return axios.post(`http://localhost:3001/${topicId}`, message)
}

function subscription(topicId){
    return new webSocket(`ws://localhost:3001/${topicId}`)
}

module.exports.publish = publish;
module.exports.subscription = subscription;