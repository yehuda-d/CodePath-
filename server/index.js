const express = require('express');
const pool = require('./db');
const app = express();
const port = 3001;

app.get('/', (req, res) => {
    res.send('CodePath server is runnig!')
});

app.get('/api/skill-nodes', async (req, res) => {
  try {
    const result = await pool.query('SELECT * FROM skill_nodes ORDER BY id');
    res.json(result.rows);
  } catch (err) {
    console.error(err);
    res.status(500).json({ error: 'Database error' });
  }
});

app.listen(port, () => {
    console.log(`Server listening on http://localhost:${port}`);
    
});