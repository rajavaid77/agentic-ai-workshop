#!/bin/bash

echo "Setting up the Amazon Bedrock Agentic AI Workshop..."

# Clone the workshop repository
echo "Cloning workshop repository..."
git clone https://github.com/kwangwl/amazon_bedrock_agentic_ai_workshop.git /home/sagemaker-user/workshop

# Check if the clone was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to clone the workshop repository."
    exit 1
fi

# Download the Streamlit URL helper script
echo "Downloading Streamlit URL helper script..."
curl "https://raw.githubusercontent.com/rajavaid77/agentic-ai-workshop/refs/heads/main/get_streamlit_url.sh" -o "/home/sagemaker-user/get_streamlit_url.sh"

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to download the Streamlit URL helper script."
    exit 1
fi

# Make the helper script executable
echo "Making helper script executable..."
chmod +x /home/sagemaker-user/get_streamlit_url.sh

# Check if chmod was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to make the helper script executable."
    exit 1
fi

echo "Setup completed successfully!"
echo "Workshop files are available in /home/sagemaker-user/workshop"
echo "To get the Streamlit URL, run: /home/sagemaker-user/get_streamlit_url.sh"

exit 0
