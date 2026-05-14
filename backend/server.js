const express = require('express');
const app = express();
app.use(express.json());

app.post('/api/book', (req, res) => {
    const { vehicle, service } = req.body;
    
    // Generate ID: SCCS + Date + Random suffix
    const dateStr = new Date().toISOString().slice(2,10).replace(/-/g, "");
    const randomSuffix = Math.random().toString(36).substring(2,4).toUpperCase();
    const bookingID = `SCCS-${dateStr}-${randomSuffix}`;

    // Database logic goes here (INSERT INTO bookings...)
    
    res.json({ success: true, bookingID: bookingID });
});

app.listen(3000, () => console.log("Server running on port 3000"));