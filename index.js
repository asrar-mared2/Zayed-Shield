const express = require('express');
const dotenv = require('dotenv');
const helmet = require('helmet');
const cors = require('cors');

dotenv.config();

const app = express();
app.use(express.json());
app.use(helmet());
app.use(cors());

// ✅ نقطة البداية
app.get('/', (req, res) => {
  res.send('🛡️ Zayed-Shield API is live and sovereign!');
});

// ✅ نقطة فحص الحالة
app.get('/status', (req, res) => {
  res.json({
    status: '🟢 Active',
    timestamp: new Date().toISOString(),
    message: 'Zayed-Shield is operational and sovereign.',
  });
});

// ✅ شعار التشغيل
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`
╔══════════════════════════════════════╗
║ 🚀 ZAYED-SHIELD IS NOW ONLINE       ║
║ 🛡️  Listening on port ${PORT}              ║
║ 📅  ${new Date().toLocaleString()}       ║
╚══════════════════════════════════════╝
`);
});
