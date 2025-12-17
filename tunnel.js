const localtunnel = require('localtunnel');

(async () => {
  const tunnel = await localtunnel({ port: 3000 });

  console.log(`🔗 Public URL: ${tunnel.url}`);

  tunnel.on('close', () => {
    console.log('❌ Tunnel closed');
  });
})();
