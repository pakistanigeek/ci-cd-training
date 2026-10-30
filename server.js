const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.status(200).send({
    message: 'CI/CD Pipeline Active',
  });
});

if (require.main === module) {
  app.listen(3000, () => {
    console.log('Server is running on port 3000');
  });
}
module.exports = app;
