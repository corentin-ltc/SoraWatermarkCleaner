# 🎬 Guide d'Utilisation - SoraWatermarkCleaner

## ✅ Installation Terminée !

Les dépendances sont installées. Tu as 3 façons d'utiliser le projet :

---

## 📱 Méthode 1 : Interface Web (Recommandé)

**La plus simple avec interface graphique drag & drop**

```bash
cd /Users/corentinlt/dev/SoraWatermarkCleaner
.venv/bin/streamlit run app.py
```

Ensuite ouvre ton navigateur sur : **http://localhost:8501**

### Fonctionnalités :
- ✅ Drag & drop de vidéos
- ✅ Traitement par lots (plusieurs vidéos)
- ✅ Prévisualisation avant/après
- ✅ Barre de progression en temps réel
- ✅ Téléchargement direct

---

## 💻 Méthode 2 : Ligne de Commande (Batch Processing)

**Idéal pour traiter un dossier entier de vidéos**

```bash
cd /Users/corentinlt/dev/SoraWatermarkCleaner

# Active l'environnement virtuel
source .venv/bin/activate

# Traiter toutes les vidéos .mp4 d'un dossier
python cli.py -i /chemin/vers/dossier/input -o /chemin/vers/dossier/output

# Traiter uniquement les .mov
python cli.py -i /chemin/input -o /chemin/output --pattern "*.mov"

# Traiter tous les formats
python cli.py -i /chemin/input -o /chemin/output --pattern "*.{mp4,mov,avi}"

# Mode silencieux (sans barre de progression)
python cli.py -i /chemin/input -o /chemin/output --quiet
```

### Exemple concret pour tes vidéos :
```bash
# Si tes vidéos Sora sont dans ~/Downloads/sora_videos
python cli.py -i ~/Downloads/sora_videos -o ~/Downloads/sora_clean
```

---

## 🐍 Méthode 3 : Script Python

**Pour intégrer dans ton propre code**

J'ai créé un script d'exemple : `test_remove.py`

```python
from pathlib import Path
from sorawm.core import SoraWM

# Charge le modèle (téléchargement auto au 1er lancement)
sora_wm = SoraWM()

# Traite une vidéo
input_video = Path("ma_video_sora.mp4")
output_video = Path("ma_video_clean.mp4")

sora_wm.run(input_video, output_video)
```

Pour l'exécuter :
```bash
cd /Users/corentinlt/dev/SoraWatermarkCleaner
.venv/bin/python test_remove.py
```

---

## 📝 Notes Importantes

### ⏬ Premier Lancement
Au premier lancement, les modèles IA seront téléchargés automatiquement :
- **YOLO** (détection watermark) : ~25 MB
- **LAMA** (nettoyage) : ~75 MB

### 🎯 Watermark avec Username (Sora 2)
Le modèle YOLO est **déjà à jour** pour détecter les nouveaux watermarks Sora 2 qui incluent le username. Ça devrait fonctionner directement !

### ⚡ Performance
- **GPU recommandé** : Le traitement utilise CUDA (NVIDIA) ou MPS (Apple Silicon) si disponible
- **Sur Mac M1/M2/M3** : Utilisera automatiquement le GPU Apple Silicon
- **Temps de traitement** : Environ 1-2 min pour une vidéo de 10 secondes

### 📂 Structure des Fichiers
```
SoraWatermarkCleaner/
├── input_video.mp4          ← Place ta vidéo ici
├── output_video_clean.mp4   ← Résultat ici
├── outputs/                 ← Dossier de sortie par défaut
├── resources/               ← Modèles téléchargés
└── test_remove.py           ← Script d'exemple
```

---

## 🚀 Quick Start

**Pour traiter une vidéo rapidement :**

1. Place ta vidéo dans le dossier :
```bash
cp ~/Downloads/ma_video_sora.mp4 /Users/corentinlt/dev/SoraWatermarkCleaner/input_video.mp4
```

2. Lance le traitement :
```bash
cd /Users/corentinlt/dev/SoraWatermarkCleaner
.venv/bin/python -c "
from pathlib import Path
from sorawm.core import SoraWM

print('🎬 Nettoyage de la vidéo...')
sora_wm = SoraWM()
sora_wm.run(Path('input_video.mp4'), Path('output_video_clean.mp4'))
print('✅ Terminé ! Vidéo : output_video_clean.mp4')
"
```

3. Récupère ta vidéo nettoyée :
```bash
open output_video_clean.mp4
```

---

## 🆘 Besoin d'Aide ?

- Documentation complète : `README.md`
- Problèmes : https://github.com/linkedlist771/SoraWatermarkCleaner/issues
- Dataset d'entraînement : https://huggingface.co/datasets/LLinked/sora-watermark-dataset
