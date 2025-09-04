# Access Streamlit App running in SageMaker Studio

## Context
In the **Agentic AI Workshop: AI Investment Advisor** hands-on workshop, particants use VS Code to carry out coding tasks to understand agentic patterns and to build a simple Agentic AI application. Participants access VS Code through a browser with the [Code Server](https://github.com/coder/code-server) installed on an [Amazon EC2](https://aws.amazon.com/ec2/) instance in an AWS accounts provisioned through [Workshop Studio](https://studio.us-east-1.prod.workshops.aws/workshops). This VS Code is made available using a public Elastic IP attached to the EC2 instance. Some of the labs in the workshop also use [streamlit](https://streamlit.io/) for user interaction and viewing code output. Workshop participants run the code as well as the streamlit application using the Terminal window available in the VS Code IDE. Each workshop participant is allocated their own workshop AWS Account. Each AWS workshop account has it's own EC2 Instance with a distinct Public IP.


## Challenge
Due to a networking policy at SPGI, the public IP of the EC2 instance is unreachable at certain SPGI Offices. This means that when running workshop events at these locations, the participants won't be able to access the VS Code IDE to complete the coding tasks. They would not also be able to run the streamlit application to test the features and view the results. However, particants can complete other parts of the labs that include using the AWS console to carry out tasks.

## Solution
1. Use SageMaker Studio Jupyterlab app to carry out coding tasks and to run streamlit application.
2. Use the Terminal within SageMaker Studio Jupyterlab to run the python applications.
3. Use Jupyterlab proxy to view the streamlit application through the browser.

The workshop participants should follow the instructions in the next section to setup their SageMaker Studio Jupyterlab for the workshop labs.

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
