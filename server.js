/**
 * BaoPixel - Serveur Express pour la redirection des pages 404
 * 
 * Installation: npm install express
 * Utilisation: node server.js
 * Le serveur écoute sur le port 3000
 */

const express = require('express');
const path = require('path');
const compression = require('compression');
const app = express();

// Middleware de compression
app.use(compression());

// Servir les fichiers statiques
app.use(express.static(path.join(__dirname, '')));

// Redirection des URLs sans extension vers les fichiers HTML
app.use((req, res, next) => {
    // Si la demande est pour une route sans extension et sans point
    if (!req.path.includes('.') && req.path !== '/') {
        const htmlFile = path.join(__dirname, req.path + '.html');
        // Essayer de servir le fichier HTML correspondant
        res.sendFile(htmlFile, (err) => {
            if (err) {
                // Si le fichier n'existe pas, continuer vers le gestionnaire 404
                next();
            }
        });
    } else {
        next();
    }
});

// Gestionnaire d'erreurs 404 - Rediriger vers 404.html
app.use((req, res) => {
    res.status(404).sendFile(path.join(__dirname, '404.html'));
});

// Démarrer le serveur
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`🚀 BaoPixel server est en ligne sur http://localhost:${PORT}`);
});
