const messageingApi  = require("./messageApi")
const readline = require('readline');

const topicId = process.env.TOPIC_ID;
const terminal = readline.createInterface({
    input:process.stdin,
})

terminal.on('line', text => {
    const name = process.env.NAME;

    const message = {name, text};
    messageingApi.publish(message, topicId);
})