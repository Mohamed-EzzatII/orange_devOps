const express = require('express');

const app = express();

app.get('/',(req,res)=>{
    res.send("<h1>Hello Ezzat</h1>");
});
app.listen(4000,
    ()=>{
        console.log("welcome on port 4000");
    }
);