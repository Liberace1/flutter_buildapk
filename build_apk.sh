#!/bin/bash

set -e  # Exit immediately if a command fails

echo "Be calm, this will take a while... Go grab a coffee, or are you a tea person?"
mkdir -p output  # Ensure the output folder exists inside Automation
sleep 5s

echo "-----------------------------------------------------------------------------------------"
echo "Well, the show is about to begin! I'm going on a vacation right now! 🤖☕"
echo "You can sit here and watch me do all this geeky stuff, or return those missed calls. It's up to you!"

# Move up one level to set the correct Docker build context
cd ..

# Build the Docker image using Automation/Dockerfile and set eventickit/ as the context
docker build -t eventickit-app -f Automation/Dockerfile .

# Move back into Automation after building
cd Automation

# Run the container and mount the output directory inside Automation/
docker run --rm -v "$(pwd -W)/output:/app/output" eventickit-app

echo "If DHL doesn't lose my package, it should be delivered to your Automation/output folder! 📦"
ls -lh output/
