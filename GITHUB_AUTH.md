# 🔐 Configuration de l'Authentification GitHub

GitHub nécessite une authentification pour pusher du code. Tu as 2 options :

---

## ✅ Option 1 : SSH (RECOMMANDÉ - Plus Simple)

### Étape 1 : Vérifier si tu as déjà une clé SSH

```bash
ls -la ~/.ssh
```

Si tu vois `id_rsa.pub` ou `id_ed25519.pub`, tu as déjà une clé ! Passe à l'étape 3.

### Étape 2 : Créer une clé SSH (si nécessaire)

```bash
ssh-keygen -t ed25519 -C "corentin-ltc@users.noreply.github.com"
```

Appuie sur Entrée 3 fois (pour accepter les valeurs par défaut).

### Étape 3 : Copier ta clé publique

```bash
cat ~/.ssh/id_ed25519.pub | pbcopy
```

(Ta clé est maintenant dans le presse-papiers)

### Étape 4 : Ajouter la clé sur GitHub

1. Va sur : https://github.com/settings/keys
2. Clique sur "New SSH key"
3. Titre : "Mac - SoraWatermark"
4. Colle ta clé (Cmd+V)
5. Clique sur "Add SSH key"

### Étape 5 : Changer l'URL du repo en SSH

```bash
cd /Users/corentinlt/dev/SoraWatermarkCleaner

git remote set-url origin git@github.com:corentin-ltc/SoraWatermarkCleaner.git

# Tester la connexion
ssh -T git@github.com
```

Tu devrais voir : "Hi corentin-ltc! You've successfully authenticated..."

### Étape 6 : Pusher vers ton fork

```bash
git push origin --all
git push origin --tags
```

✅ Fini ! Tu n'auras plus jamais à t'authentifier.

---

## 🔑 Option 2 : Token d'Accès Personnel (PAT)

### Étape 1 : Créer un token

1. Va sur : https://github.com/settings/tokens?type=beta
2. Clique sur "Generate new token" (classic)
3. Note : "SoraWatermark Mac"
4. Expiration : "No expiration" (ou choisis une durée)
5. Sélectionne les permissions :
   - ✅ repo (toutes les sous-permissions)
6. Clique sur "Generate token"
7. **COPIE LE TOKEN** (tu ne le reverras pas !)

### Étape 2 : Utiliser le token

Quand Git te demande un mot de passe :
- **Username** : `corentin-ltc`
- **Password** : Colle ton token (pas ton mot de passe GitHub !)

### Étape 3 : Sauvegarder le token (optionnel)

Pour ne pas avoir à le retaper :

```bash
git config --global credential.helper osxkeychain
```

Puis push une fois en entrant le token, il sera sauvegardé.

---

## 🚀 Commandes Finales (après authentification)

```bash
cd /Users/corentinlt/dev/SoraWatermarkCleaner

# Push toutes les branches
git push origin --all

# Push tous les tags
git push origin --tags

# Vérifier que tout est bien pushé
git --no-pager log --oneline -5
```

---

## ✅ Vérification

Après le push, vérifie que ton fork est à jour :
👉 https://github.com/corentin-ltc/SoraWatermarkCleaner

Tu devrais voir tous les fichiers et commits !

---

## 💡 Recommandation

**SSH est plus simple** car tu n'as plus jamais à entrer de mot de passe ou token après la configuration initiale.
