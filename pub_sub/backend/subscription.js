const messageingApi = require("./messageApi")

const topicId = process.env.TOPIC_ID;
console.log( process.env.TOPIC_ID);
function displayMessage(message){
    console.log(`> ${message.name} ${message.text}`)
}

function streamMessage(){
    const messageSocket = messageingApi.subscription(topicId);

    messageSocket.on('message', (data) =>{
        const message = JSON.parse(data);
        displayMessage(message);
    })
}

streamMessage();