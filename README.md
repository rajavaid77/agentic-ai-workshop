## Workround Restrictions on Public IP access

As a workaround to the restrictions on accessing public ip needed to run remote VS Code IDE, we would perform the workshop using SageMaker AI Studio. 

Follow these steps using the Terminal (File --> New --> Terminal) in your SageMaker Studio JupyterLab.


### Clone the repo for the workshop

```bash
  git clone https://github.com/kwangwl/amazon_bedrock_agentic_ai_workshop.git /home/sagemaker-user/workshop
```

### Download script 
We download a sample bash script that will retrieve the url that we can use to access Streamlit app running inside the SageMaker AI Studio environment.

```bash
  curl "https://raw.githubusercontent.com/rajavaid77/agentic-ai-workshop/refs/heads/main/get_streamlit_url.sh" -o "/home/sagemaker-user/get_streamlit_url.sh"
  chmod +x /home/sagemaker-user/get_streamlit_url.sh

```

