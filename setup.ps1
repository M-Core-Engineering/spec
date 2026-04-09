# setup.ps1 - Initialisation de l'écosystème EDPI sur Windows

# 1. Configuration de la politique d'exécution pour la session actuelle
Write-Host "--- Configuration de la politique d'exécution ---" -ForegroundColor Cyan
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope Process -Force

# 2. Vérification et Installation de Scoop
if (!(Get-Command scoop -ErrorAction SilentlyContinue)) {
    Write-Host "--- Installation de Scoop (Gestionnaire de paquets) ---" -ForegroundColor Yellow
    Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
} else {
    Write-Host "--- Scoop est déjà présent, mise à jour en cours ---" -ForegroundColor Green
    scoop update
}

# 3. Vérification et Installation de Go-Task
if (!(Get-Command task -ErrorAction SilentlyContinue)) {
    Write-Host "--- Installation de Go-Task via Scoop ---" -ForegroundColor Yellow
    scoop install task
} else {
    Write-Host "--- Go-Task est déjà présent ---" -ForegroundColor Green
}

# 4. Rafraîchissement des variables d'environnement pour la session
$env:PATH = [System.Environment]::GetEnvironmentVariable("Path","User") + ";" + [System.Environment]::GetEnvironmentVariable("Path","Machine")

# 5. Lancement de l'orchestration principale
Write-Host "--- Lancement de la configuration de l'écosystème (task setup:dev) ---" -ForegroundColor Cyan
task setup:dev

Write-Host "`n--- Setup terminé avec succès ! ---" -ForegroundColor Green
Write-Host "Note : Vous devrez peut-être redémarrer votre terminal pour finaliser le PATH." -ForegroundColor Gray