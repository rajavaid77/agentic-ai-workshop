# Access Streamlit App running in SageMaker Studio

This guide provides instructions for accessing the Amazon Bedrock Agentic AI Workshop using SageMaker Studio, which serves as an alternative to remote VS Code IDE when public IP access is restricted.

## Setup Instructions

### 1. Open Terminal in SageMaker Studio

Open a terminal in SageMaker Studio:
- Navigate to File → New → Terminal

### 2. Download the Workshop assets

In the terminal, run:

```bash
curl "https://ws-assets-prod-iad-r-pdx-f3b3f9f1a7d6a3d0.s3.us-west-2.amazonaws.com/5d74d234-0149-4b82-982a-4c040b85d0f2/workshop_2.zip" -o "/home/sagemaker-user/workshop.zip"
unzip /home/sagemaker-user/workshop.zip -d /home/sagemaker-user/workshop
```

### 3. Download the Streamlit Access Script

This script will generate the URL needed to access the Streamlit application running in your SageMaker Studio environment:

```bash
curl "https://raw.githubusercontent.com/rajavaid77/agentic-ai-workshop/refs/heads/main/get_streamlit_url.sh" -o "/home/sagemaker-user/get_streamlit_url.sh"
chmod +x /home/sagemaker-user/get_streamlit_url.sh
```

### 4. Generate Streamlit Access URL

Run the script to generate your unique Streamlit application URL:

```bash
~/get_streamlit_url.sh
```

Copy the generated URL to access the workshop's Streamlit interface.

## Troubleshooting

If you encounter issues:
- Verify your SageMaker Studio instance has the necessary permissions
- Ensure all commands are executed in the correct order
- Check that the repository URL is accessible from your environment

## Additional Resources

For more information about the workshop content, refer to the documentation in the cloned repository.
