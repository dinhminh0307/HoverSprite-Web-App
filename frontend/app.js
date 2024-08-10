const express = require('express');
const app = express();
const body_parser = require('body-parser');

const SignupPath = __dirname + '/src/pages/Signup.html'
const registerPath = __dirname + '/src/pages/Register.html'
const loginPath = __dirname + '/src/pages/Login.html'
const aboutPath = __dirname + '/src/pages/HomePage.html'

app.use(body_parser.urlencoded({extended: true}));

// Serve static images from the public directory
app.use('/public', express.static('./public'));

app.use('/css', express.static('src/css'));

// Serve pages - need to individually set routes if they require specific handling
app.use('/pages', express.static('src/pages'));

app.use('/components', express.static('src/components'));

app.use('/js', express.static('src/js'));


// handle routing
app.get('/', (req,res)=> {
    res.sendFile(SignupPath);
})

app.get('/register', (req,res)=> {
    res.sendFile(registerPath);
})

app.get('/login', (req,res)=> {
    res.sendFile(loginPath);
})

app.get('/about-us', (req,res) => {
    res.sendFile(aboutPath);
})

app.listen(3000, () => {
    console.log("listen on port");

})