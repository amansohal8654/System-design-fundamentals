const database = {
    ["index.html"]: "<html>Hello Aman</html>",
}

module.exports.get = (key, callback) => {
    setTimeout(() => {
        callback(database[key]);
    }, 3000);
}