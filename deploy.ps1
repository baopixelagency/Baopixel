# Script PowerShell pour déployer le site BaoPixel sur GitHub Pages
# Utilisation: .\deploy.ps1 "Message de commit"

param(
    [Parameter(Mandatory=$false)]
    [string]$CommitMessage = "Mise à jour du site BaoPixel"
)

# Couleurs
$ColorGreen = "Green"
$ColorRed = "Red"
$ColorYellow = "Yellow"
$ColorCyan = "Cyan"

Write-Host ""
Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor $ColorCyan
Write-Host "║       SCRIPT DE DÉPLOIEMENT - BAOPIXEL (PowerShell)           ║" -ForegroundColor $ColorCyan
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor $ColorCyan
Write-Host ""

# Vérifier que git est installé
Write-Host "🔍 Vérification de Git..." -ForegroundColor $ColorYellow
try {
    git --version | Out-Null
    Write-Host "✅ Git détecté" -ForegroundColor $ColorGreen
} catch {
    Write-Host "❌ Git n'est pas installé ou non accessible" -ForegroundColor $ColorRed
    exit 1
}

Write-Host ""

# Aller au répertoire du projet
Write-Host "📍 Localisation du projet..." -ForegroundColor $ColorYellow
$projectPath = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location $projectPath
Write-Host "✅ Dossier courant: $(Get-Location)" -ForegroundColor $ColorGreen
Write-Host ""

# Vérifier le statut Git
Write-Host "📊 Vérification du statut Git..." -ForegroundColor $ColorYellow
git status
Write-Host ""

# Ajouter les fichiers
Write-Host "📦 Ajout de tous les fichiers..." -ForegroundColor $ColorYellow
git add .
Write-Host "✅ Fichiers ajoutés" -ForegroundColor $ColorGreen
Write-Host ""

# Créer le commit
Write-Host "📝 Création du commit..." -ForegroundColor $ColorYellow
Write-Host "   Message: '$CommitMessage'" -ForegroundColor Gray

git commit -m "$CommitMessage" 2>&1 | ForEach-Object {
    if ($_ -match "changed") {
        Write-Host "✅ Commit créé" -ForegroundColor $ColorGreen
    } elseif ($_ -match "nothing to commit") {
        Write-Host "⚠️  Aucun changement à committer" -ForegroundColor $ColorYellow
    }
}

Write-Host ""

# Pusher vers GitHub
Write-Host "🚀 Envoi vers GitHub..." -ForegroundColor $ColorYellow

$pushOutput = git push origin main 2>&1
if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Push réussi!" -ForegroundColor $ColorGreen
} else {
    Write-Host "❌ ERREUR: Échec du push" -ForegroundColor $ColorRed
    Write-Host ""
    Write-Host "Suggestions:" -ForegroundColor $ColorYellow
    Write-Host "  • Vérifier la connexion Internet" -ForegroundColor Gray
    Write-Host "  • Vérifier que le remote est configuré: git remote -v" -ForegroundColor Gray
    Write-Host "  • Vérifier vos identifiants GitHub" -ForegroundColor Gray
    Write-Host ""
    exit 1
}

Write-Host ""

# Afficher le dernier commit
Write-Host "📍 Dernier commit:" -ForegroundColor $ColorYellow
git log --oneline -1 | ForEach-Object {
    Write-Host "   $_" -ForegroundColor Gray
}

Write-Host ""

# Afficher les statistiques
Write-Host "📊 Statistiques du dépôt:" -ForegroundColor $ColorCyan
$commitCount = (git log --oneline | Measure-Object -Line).Lines
$fileCount = (git ls-files | Measure-Object -Line).Lines

Write-Host "   • Total de commits: $commitCount" -ForegroundColor Gray
Write-Host "   • Total de fichiers: $fileCount" -ForegroundColor Gray
Write-Host ""

# URL du site
Write-Host "🌐 URL du site:" -ForegroundColor $ColorCyan
Write-Host "   • GitHub Pages: https://USERNAME.github.io" -ForegroundColor Gray
Write-Host "   • Domaine personnalisé: https://baopixel.com" -ForegroundColor Gray
Write-Host ""

Write-Host "╔════════════════════════════════════════════════════════════════╗" -ForegroundColor $ColorGreen
Write-Host "║  ✅ DÉPLOIEMENT RÉUSSI!                                       ║" -ForegroundColor $ColorGreen
Write-Host "║  Le site se met à jour dans 3-5 minutes sur GitHub Pages      ║" -ForegroundColor $ColorGreen
Write-Host "╚════════════════════════════════════════════════════════════════╝" -ForegroundColor $ColorGreen
Write-Host ""

# Pause avant la fermeture
Read-Host "Appuyez sur ENTRÉE pour fermer..."
