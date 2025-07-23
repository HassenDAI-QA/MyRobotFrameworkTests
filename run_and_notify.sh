#!/bin/bash

# 📍 Étape 1 : Définir les chemins
TEST_DIR="tests"
REPORT_PATH="output.html"
LOG_PATH="log.html"
OUTPUT_XML="output.xml"

# 📍 Étape 2 : Exécuter les tests Robot Framework
robot --output "$OUTPUT_XML" --log "$LOG_PATH" --report "$REPORT_PATH" "$TEST_DIR"

# 📍 Étape 3 : Vérifier si les tests ont réussi
if [ $? -eq 0 ]; then
    echo "✅ Tests réussis. Envoi du rapport via n8n..."

    # 📍 Étape 4 : Lancer le workflow n8n (en local)
    # Assurez-vous que le fichier existe avant d'essayer de l'envoyer
    if [ -f "$REPORT_PATH" ]; then
        # Envoyer le contenu du fichier output.html comme corps de la requête POST
        curl -X POST --data-binary "@$REPORT_PATH" \
             -H "Content-Type: text/html" \
             http://localhost:5678/webhook/send-test-report
    else
        echo "⚠️ Fichier rapport $REPORT_PATH non trouvé. Envoi du webhook sans rapport."
        curl -X POST http://localhost:5678/webhook/send-test-report
    fi

else
    echo "❌ Échec des tests. Aucun email ne sera envoyé."
    exit 1
fi