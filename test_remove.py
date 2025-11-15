from pathlib import Path
from sorawm.core import SoraWM

# Exemple d'utilisation simple
if __name__ == "__main__":
    # Remplace ce chemin par ton fichier vidéo
    input_video_path = Path("input_video.mp4")
    output_video_path = Path("output_video_clean.mp4")
    
    print("🎬 Initialisation de SoraWatermarkCleaner...")
    print("📥 Au premier lancement, les modèles IA seront téléchargés (~100MB)")
    print("    - YOLO pour la détection du watermark")
    print("    - LAMA pour le nettoyage")
    print()
    
    sora_wm = SoraWM()
    
    print(f"🎥 Traitement de la vidéo: {input_video_path}")
    sora_wm.run(input_video_path, output_video_path)
    
    print(f"✅ Terminé ! Vidéo nettoyée: {output_video_path}")
