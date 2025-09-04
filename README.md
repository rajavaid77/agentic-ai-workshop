# Workshop Access Guide: SageMaker Studio for Amazon Bedrock Agentic AI Workshop

This guide provides instructions for accessing the Amazon Bedrock Agentic AI Workshop using SageMaker Studio, which serves as an alternative to remote VS Code IDE when public IP access is restricted.

## Setup Instructions

Follow these steps in your SageMaker Studio JupyterLab environment:

### 1. Clone the Workshop Repository

Open a terminal in SageMaker Studio (File → New → Terminal) and run:

```bash
git clone https://github.com/kwangwl/amazon_bedrock_agentic_ai_workshop.git /home/sagemaker-user/workshop
```

### 2. Download the Streamlit Access Script

This script will generate the URL needed to access the Streamlit application running in your SageMaker Studio environment:

```bash
curl "https://raw.githubusercontent.com/rajavaid77/agentic-ai-workshop/refs/heads/main/get_streamlit_url.sh" -o "/home/sagemaker-user/get_streamlit_url.sh"
chmod +x /home/sagemaker-user/get_streamlit_url.sh
```

### 3. Generate Streamlit Access URL

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
