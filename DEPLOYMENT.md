# 📚 GUIDE DE DÉPLOIEMENT - BAOPIXEL

## 1️⃣ DÉPLOIEMENT SUR GITHUB PAGES

### Étape 1 : Créer un dépôt GitHub

1. Aller sur [github.com](https://github.com) et se connecter
2. Cliquer sur **"New"** pour créer un nouveau dépôt
3. **Nom du dépôt** : `baopixel.github.io` (obligatoire pour GitHub Pages)
4. Sélectionner **"Public"**
5. Cliquer sur **"Create repository"**

### Étape 2 : Ajouter le remote GitHub

```bash
# Naviguer dans le dossier du projet
cd "c:\Users\tanor fall\Documents\Baopixel\site web\Baopixel"

# Ajouter le remote GitHub
git remote add origin https://github.com/VOTRE_USERNAME/baopixel.github.io.git

# Vérifier que le remote est bien ajouté
git remote -v
```

### Étape 3 : Pousser le code vers GitHub

```bash
# Renommer la branche locale en main (si nécessaire)
git branch -M main

# Pousser le code vers GitHub
git push -u origin main
```

### Étape 4 : Activer GitHub Pages

1. Sur la page du dépôt GitHub
2. Aller dans **Settings** (Paramètres)
3. Aller dans l'onglet **"Pages"** (à gauche)
4. Sous **"Source"**, sélectionner :
   - **Branch** : `main`
   - **Folder** : `/ (root)`
5. Cliquer sur **"Save"**

### 🎉 Votre site est en ligne!

**URL publique** : `https://VOTRE_USERNAME.github.io`

---

## 2️⃣ CONFIGURER UN DOMAINE PERSONNALISÉ

### Si vous avez un domaine (ex: baopixel.com)

#### Étape 1 : Créer un fichier CNAME

```bash
# À la racine du projet, créer un fichier CNAME
echo "baopixel.com" > CNAME

# Ou pour www
echo "www.baopixel.com" > CNAME

# Puis commit et push
git add CNAME
git commit -m "Ajouter domaine personnalisé"
git push origin main
```

#### Étape 2 : Configurer DNS chez votre registrar

Ajouter les enregistrements DNS suivants :

**Pour un domaine sans www :**
```
Enregistrement A:
185.199.108.153
185.199.109.153
185.199.110.153
185.199.111.153
```

**Pour www.baopixel.com :**
```
Enregistrement CNAME:
VOTRE_USERNAME.github.io
```

#### Étape 3 : Vérifier dans GitHub

1. Aller dans **Settings → Pages**
2. Vérifier que le domaine personnalisé est configuré
3. Cocher **"Enforce HTTPS"** (important pour la sécurité)

---

## 3️⃣ MISE À JOUR DU SITE

### Après chaque modification locale :

```bash
# 1. Ajouter les changements
git add .

# 2. Créer un commit descriptif
git commit -m "Description de la modification"

# 3. Pousser vers GitHub
git push origin main
```

### GitHub Pages se met à jour automatiquement (3-5 minutes)

---

## 4️⃣ DÉPLOIEMENT ALTERNATIF (Actions GitHub)

### Automatiser les builds avec GitHub Actions

Créer le fichier `.github/workflows/deploy.yml` :

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches: [ main ]

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./
          cname: baopixel.com
```

---

## 5️⃣ VÉRIFICATION DU DÉPLOIEMENT

### Vérifier les fichiers pushés :

```bash
# Voir l'historique des commits
git log --oneline

# Voir les branches
git branch -a

# Voir le remote
git remote -v
```

### Tester le site :

1. Aller sur `https://VOTRE_USERNAME.github.io`
2. Vérifier que toutes les pages se chargent
3. Tester les formulaires (Formspree)
4. Vérifier la redirection 404

---

## 6️⃣ COMMANDES UTILES

```bash
# Voir le statut
git status

# Ajouter un fichier spécifique
git add nom_du_fichier.html

# Ajouter tous les fichiers
git add .

# Créer un commit
git commit -m "Message descriptif"

# Pousser les changements
git push origin main

# Voir l'historique
git log

# Voir les différences
git diff

# Revenir à un commit précédent
git revert HASH_DU_COMMIT
```

---

## 7️⃣ RÉSOLUTION DE PROBLÈMES

### Le site ne se met pas à jour

1. Vérifier que le push a réussi : `git push origin main`
2. Vérifier dans **Settings → Pages** que GitHub Pages est activé
3. Attendre 3-5 minutes (délai de build GitHub)
4. Vider le cache du navigateur (Ctrl+Shift+Delete)

### Erreur "Repository not found"

```bash
# Vérifier le remote
git remote -v

# Mettre à jour le remote
git remote set-url origin https://github.com/USERNAME/baopixel.github.io.git
```

### Erreur d'authentification

```bash
# Si vous avez changé votre password, générer un token GitHub
# https://github.com/settings/tokens

# Puis utiliser le token :
git remote set-url origin https://TOKEN@github.com/USERNAME/baopixel.github.io.git
```

---

## 📊 RÉSUMÉ DU DÉPLOIEMENT

| Étape | Commande | Résultat |
|-------|----------|---------|
| 1 | Créer dépôt GitHub | ✅ Dépôt vide prêt |
| 2 | `git remote add origin ...` | ✅ Lien établi |
| 3 | `git push -u origin main` | ✅ Code en ligne |
| 4 | Activer GitHub Pages | ✅ Site accessible |
| 5 | Configurer domaine (optionnel) | ✅ URL personnalisée |

---

## 🔐 SÉCURITÉ & PERFORMANCE

- ✅ HTTPS activé automatiquement par GitHub Pages
- ✅ CDN global pour une livraison rapide
- ✅ Cache control pour les assets statiques
- ✅ Compression GZIP automatique
- ✅ Redirections 404 gérées

---

**Date** : 3 février 2026  
**Site** : https://baopixel.com  
**GitHub** : https://github.com/baopixel/baopixel.github.io
