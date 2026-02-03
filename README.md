# Dépôt du site web BaoPixel - Agence créative

Site web officiel de **BaoPixel**, une agence de communication audiovisuelle spécialisée dans l'immobilier.

## 📋 Contenu

- **Pages principales** : Accueil, Réalisations, Services, Devis, À propos, Contact
- **Pages légales** : Politique de confidentialité, Conditions générales, Politique des cookies
- **Formulaires** : Devis, Contact, Candidature (Rejoindre l'équipe)

## 🚀 Accès au site

- **URL officielle** : [baopixel.com](https://baopixel.com)
- **GitHub Pages** : [github.com/baopixel/baopixel.github.io](https://github.com/baopixel/baopixel.github.io)

## 🛠️ Technologies utilisées

- **HTML5** - Structure sémantique
- **CSS3** - Design responsive
- **JavaScript** - Interactions et animations
- **Bootstrap Grid** - Système de grille responsive
- **GSAP** - Animations avancées
- **Swiper.js** - Carousels et sliders
- **FancyBox** - Galeries d'images
- **Font Awesome** - Icons

## 📂 Structure du projet

```
baopixel/
├── index.html              # Page d'accueil
├── portfolio-2.html        # Page des réalisations
├── services.html           # Services proposés
├── service.html            # Détail d'un service
├── devis.html              # Formulaire de devis
├── team.html               # Équipe et À propos
├── contact.html            # Contact
├── blog.html               # Blog
├── blog-inner.html         # Article blog détaillé
├── publication.html        # Publications
├── project-*.html          # Détails des projets (1-6)
├── portfolio-*.html        # Galeries portfolio (1-3)
├── home-2.html             # Page d'accueil alternative
├── privacy-policy.html     # Politique de confidentialité
├── terms-and-conditions.html # Conditions générales
├── cookie-policy.html      # Politique des cookies
├── join-us.html            # Rejoindre l'équipe
├── confirmation.html       # Page de confirmation
├── 404.html                # Page d'erreur 404
├── css/                    # Feuilles de style
├── js/                     # Scripts JavaScript
├── img/                    # Images et assets
├── assets/                 # Favicons et icônes
├── scss/                   # Fichiers SCSS source
├── .htaccess               # Configuration Apache
├── web.config              # Configuration IIS
├── nginx.conf              # Configuration Nginx
├── server.js               # Serveur Node.js Express
└── manifest.json           # PWA manifest

```

## 📦 Installation locale

### Avec Apache (recommandé)
1. Copier le contenu du dossier à la racine d'Apache
2. S'assurer que `.htaccess` est à la racine
3. Vérifier que `mod_rewrite` est activé
4. Accéder à `http://localhost/`

### Avec Node.js
```bash
npm install express compression
node server.js
# Le site sera accessible à http://localhost:3000
```

### Avec Python (développement local)
```bash
# Python 3
python -m http.server 8000

# Python 2
python -m SimpleHTTPServer 8000
```

## 🌐 Déploiement

### Sur GitHub Pages
```bash
git add .
git commit -m "Déploiement initial du site BaoPixel"
git push origin main
```

Puis dans les paramètres du dépôt GitHub, configurer GitHub Pages pour servir depuis la branche `main`.

### Sur un serveur Apache
1. Transférer les fichiers via FTP/SFTP
2. S'assurer que `.htaccess` est à la racine
3. Vérifier les permissions (755 pour les dossiers, 644 pour les fichiers)

### Sur un serveur Nginx
1. Transférer les fichiers
2. Appliquer la configuration `nginx.conf`
3. Redémarrer Nginx

### Sur IIS (Windows)
1. Transférer les fichiers
2. S'assurer que `web.config` est à la racine
3. Redémarrer IIS

## 🔗 Intégrations

- **Formspree** : Gestion des formulaires (devis, contact, candidature)
- **Font Awesome** : Icônes vectorielles
- **Google Fonts** : Typographie personnalisée

## 📞 Contact

- **Email** : hello@baopixel.com
- **Téléphone** : +221 76 160 95 85
- **Localisation** : Mbour/Saly, Sénégal

## 📜 Licence

Tous les droits réservés © 2026 BaoPixel. Le contenu et le design ne peuvent pas être reproduits sans autorisation.

## 👥 Contributeurs

- **BaoPixel Team** - Développement et design

---

**Dernière mise à jour** : 3 février 2026
