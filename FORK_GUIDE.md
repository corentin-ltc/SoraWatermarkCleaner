# 🔱 Guide pour Forker SoraWatermarkCleaner

## Étape 1 : Créer le Fork sur GitHub

### Option A : Via l'Interface Web (Recommandé)
1. Va sur : **https://github.com/linkedlist771/SoraWatermarkCleaner**
2. Clique sur le bouton **"Fork"** en haut à droite
3. Sélectionne ton compte GitHub
4. Le fork sera créé automatiquement

### Option B : Via GitHub CLI (si installé)
```bash
gh repo fork linkedlist771/SoraWatermarkCleaner --clone=false
```

---

## Étape 2 : Configurer Git (si pas déjà fait)

```bash
# Configure ton nom (remplace par ton nom)
git config --global user.name "Ton Nom"

# Configure ton email GitHub
git config --global user.email "ton.email@example.com"
```

---

## Étape 3 : Changer l'Origin vers ton Fork

**Une fois que tu as créé le fork sur GitHub :**

```bash
cd /Users/corentinlt/dev/SoraWatermarkCleaner

# Renomme l'origin actuel en "upstream" (garde le lien avec l'original)
git remote rename origin upstream

# Ajoute ton fork comme nouvelle origin
# ⚠️ REMPLACE "TON_USERNAME" par ton nom d'utilisateur GitHub
git remote add origin https://github.com/TON_USERNAME/SoraWatermarkCleaner.git

# Vérifie que c'est bon
git remote -v
```

Tu devrais voir :
```
origin    https://github.com/TON_USERNAME/SoraWatermarkCleaner.git (fetch)
origin    https://github.com/TON_USERNAME/SoraWatermarkCleaner.git (push)
upstream  https://github.com/linkedlist771/SoraWatermarkCleaner.git (fetch)
upstream  https://github.com/linkedlist771/SoraWatermarkCleaner.git (push)
```

---

## Étape 4 : Pusher vers ton Fork

```bash
# Push toutes les branches vers ton fork
git push origin --all

# Push tous les tags
git push origin --tags
```

---

## Étape 5 : Ajouter tes Modifications

### Créer une branche personnelle
```bash
# Créer une branche pour tes modifs
git checkout -b ma-version

# Faire tes changements...

# Commit
git add .
git commit -m "Mes personnalisations"

# Push vers ton fork
git push origin ma-version
```

---

## 🔄 Garder ton Fork à Jour

Si l'original est mis à jour, tu peux synchroniser :

```bash
# Récupérer les dernières modifs de l'original
git fetch upstream

# Fusionner avec ta branche main
git checkout main
git merge upstream/main

# Push vers ton fork
git push origin main
```

---

## 📦 Sauvegarder Localement (Alternative)

Si tu veux juste une copie locale sans GitHub :

```bash
# Créer une archive complète
cd /Users/corentinlt/dev
tar -czf SoraWatermarkCleaner_backup_$(date +%Y%m%d).tar.gz SoraWatermarkCleaner/

# Ou copier le dossier
cp -r SoraWatermarkCleaner SoraWatermarkCleaner_backup
```

---

## 🆘 Si tu perds le Repo Original

Avec ton fork sur GitHub, tu peux toujours le re-cloner :

```bash
cd /Users/corentinlt/dev
git clone https://github.com/TON_USERNAME/SoraWatermarkCleaner.git
cd SoraWatermarkCleaner
uv sync
```

---

## ✅ Commandes Rapides

**Toutes les commandes en une fois** (après avoir créé le fork sur GitHub) :

```bash
cd /Users/corentinlt/dev/SoraWatermarkCleaner

# Configure git (remplace avec tes infos)
git config user.name "Ton Nom"
git config user.email "ton.email@example.com"

# Renomme les remotes
git remote rename origin upstream
git remote add origin https://github.com/TON_USERNAME/SoraWatermarkCleaner.git

# Push tout
git push origin --all
git push origin --tags

echo "✅ Fork créé et synchronisé !"
```

---

## 📝 Notes

- **upstream** = repo original (linkedlist771)
- **origin** = ton fork personnel
- Garde le lien avec upstream pour recevoir les mises à jour
- Tu peux modifier ton fork sans affecter l'original
