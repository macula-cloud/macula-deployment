#!/bin/bash

# Start Ollama in the background.
/bin/ollama serve &
# Record Process ID.
pid=$!

# Check if the process started successfully.
if ! kill -0 $pid 2>/dev/null; then
    echo "❌ Failed to start Ollama."
    exit 1
fi

# Pause for Ollama to start.
sleep 5

echo "🔴 Retrieving $OLLAMA_MODEL model..."
if ! ollama run $OLLAMA_MODEL; then
    echo "❌ Failed to retrieve the model."
    kill $pid
    exit 1
fi

echo "🟢 Done!"

# Wait for Ollama process to finish.
wait $pid