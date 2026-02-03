@echo off
REM Script de déploiement automatique pour BaoPixel
REM Utilisation: deploy.bat "Message de commit"

setlocal enabledelayedexpansion

echo.
echo ╔════════════════════════════════════════════════════════════════╗
echo ║         SCRIPT DE DÉPLOIEMENT - BAOPIXEL                      ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.

REM Vérifier qu'un message a été fourni
if "%1"=="" (
    echo ❌ ERREUR: Veuillez fournir un message de commit
    echo.
    echo Utilisation: deploy.bat "Votre message de commit"
    echo.
    echo Exemple: deploy.bat "Mise à jour de la page de contact"
    pause
    exit /b 1
)

echo 📍 Localisation du projet...
cd /d "%~dp0"
echo ✅ Dossier courant: %cd%
echo.

echo 📊 Vérification du statut Git...
git status
echo.

echo 📦 Ajout de tous les fichiers...
git add .
echo ✅ Fichiers ajoutés
echo.

echo 📝 Création du commit: "%1"...
git commit -m "%1"
if errorlevel 1 (
    echo ⚠️  Aucun changement à committer
) else (
    echo ✅ Commit créé
)
echo.

echo 🚀 Envoi vers GitHub...
git push origin main
if errorlevel 1 (
    echo ❌ ERREUR: Échec du push
    echo.
    echo Suggestions:
    echo - Vérifier la connexion Internet
    echo - Vérifier que le remote est configuré: git remote -v
    echo - Vérifier vos identifiants GitHub
    pause
    exit /b 1
) else (
    echo ✅ Push réussi!
)
echo.

echo 📍 Dernier commit:
git log --oneline -1
echo.

echo ╔════════════════════════════════════════════════════════════════╗
echo ║  ✅ DÉPLOIEMENT RÉUSSI!                                       ║
echo ║  Le site se met à jour dans 3-5 minutes sur GitHub Pages      ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.

pause
