#!/bin/bash

echo ""
echo "🔱 =========================================="
echo "   Configuration du Fork Personnel"
echo "=========================================== 🔱"
echo ""

# Vérifier qu'on est dans le bon dossier
if [ ! -d ".git" ]; then
    echo "❌ Erreur : Ce script doit être exécuté depuis le dossier SoraWatermarkCleaner"
    exit 1
fi

# Demander le nom d'utilisateur GitHub
echo "📝 Entre ton nom d'utilisateur GitHub :"
read -p "Username: " GITHUB_USERNAME

if [ -z "$GITHUB_USERNAME" ]; then
    echo "❌ Erreur : Le nom d'utilisateur ne peut pas être vide"
    exit 1
fi

echo ""
echo "📧 Entre ton email GitHub :"
read -p "Email: " GITHUB_EMAIL

if [ -z "$GITHUB_EMAIL" ]; then
    echo "❌ Erreur : L'email ne peut pas être vide"
    exit 1
fi

echo ""
echo "👤 Entre ton nom (pour les commits) :"
read -p "Nom: " GITHUB_NAME

if [ -z "$GITHUB_NAME" ]; then
    echo "❌ Erreur : Le nom ne peut pas être vide"
    exit 1
fi

echo ""
echo "⚙️  Configuration en cours..."
echo ""

# Configurer Git
git config user.name "$GITHUB_NAME"
git config user.email "$GITHUB_EMAIL"
echo "✅ Git configuré"

# Vérifier si upstream existe déjà
if git remote | grep -q "^upstream$"; then
    echo "✅ Remote 'upstream' existe déjà"
else
    # Renommer origin en upstream
    git remote rename origin upstream 2>/dev/null
    echo "✅ Origin renommé en upstream"
fi

# Vérifier si origin pointe déjà vers le fork
CURRENT_ORIGIN=$(git remote get-url origin 2>/dev/null)
NEW_ORIGIN="https://github.com/$GITHUB_USERNAME/SoraWatermarkCleaner.git"

if [ "$CURRENT_ORIGIN" = "$NEW_ORIGIN" ]; then
    echo "✅ Origin pointe déjà vers ton fork"
else
    # Supprimer origin s'il existe
    git remote remove origin 2>/dev/null
    
    # Ajouter le nouveau origin
    git remote add origin "$NEW_ORIGIN"
    echo "✅ Origin configuré vers ton fork"
fi

echo ""
echo "📋 Configuration actuelle :"
echo ""
git remote -v

echo ""
echo "🚀 Prêt à pusher vers ton fork !"
echo ""
read -p "Veux-tu pusher maintenant ? (y/n): " PUSH_NOW

if [ "$PUSH_NOW" = "y" ] || [ "$PUSH_NOW" = "Y" ]; then
    echo ""
    echo "📤 Push en cours..."
    
    # Push toutes les branches
    if git push origin --all; then
        echo "✅ Branches pushées"
    else
        echo "⚠️  Erreur lors du push des branches"
    fi
    
    # Push tous les tags
    if git push origin --tags; then
        echo "✅ Tags pushés"
    else
        echo "⚠️  Erreur lors du push des tags (peut-être aucun tag à pusher)"
    fi
    
    echo ""
    echo "✅ Fork configuré et synchronisé !"
    echo ""
    echo "🌐 Ton fork : https://github.com/$GITHUB_USERNAME/SoraWatermarkCleaner"
else
    echo ""
    echo "⏸️  OK, tu pourras pusher plus tard avec :"
    echo "   git push origin --all"
    echo "   git push origin --tags"
fi

echo ""
echo "📖 Pour plus d'infos, consulte : FORK_GUIDE.md"
echo ""
