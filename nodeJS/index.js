const express = require('express');
const fs = require('fs');
const app = express();
const port = 3000;

app.get('/video', (req,res) => {
    const path = '/video/bunny_vid.mp4';
    fs.stat(path, (err,stats) => {
        if (err) {
            console.error('An error occured');
            res.sendStatus(500);
            return;
        }
        res.writeHead(200, {
            'Content-Length': stats.size,
            'Content-Type': 'video/mp4',
        });
        fs.createReadStream(path).pipe(res);
    });
});

app.listen(port, () => {
    console.log(`Example app listening on port ${port}`);
})