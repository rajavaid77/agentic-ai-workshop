#!/bin/sh
CURRENTDATE=`date +"%Y-%m-%d %T"`
RED='\033[0;31m'
GREEN='\033[0;32m'
BOLD='\033[1m'
NC='\033[0m'

# Fixed port number
PORT=8080

# Get JupyterLab metadata
if [ -f /opt/amazon/sagemaker/metadata/resource-metadata.json ]; then
    METADATA_PATH="/opt/amazon/sagemaker/metadata/resource-metadata.json"
elif [ -f /opt/ml/metadata/resource-metadata.json ]; then
    METADATA_PATH="/opt/ml/metadata/resource-metadata.json"
else
    echo -e "${RED}${CURRENTDATE}: [ERROR]:${NC} Cannot find resource metadata file" >&2
    exit 1
fi

# Extract domain information
DOMAIN_ID=$(jq -r '.DomainId' $METADATA_PATH)
RESOURCE_ARN=$(jq -r '.ResourceArn' $METADATA_PATH)
REGION=$(echo "$RESOURCE_ARN" | cut -d':' -f4)
SPACE_NAME=$(jq -r '.SpaceName' $METADATA_PATH 2>/dev/null || echo "")

# Fix the string comparison syntax
if [ "x$SPACE_NAME" = "x" ] || [ "$SPACE_NAME" = "null" ]; then
    # User profile access
    USER_PROFILE=$(jq -r '.UserProfileName' $METADATA_PATH)
    
    # For JupyterLab user profile, construct URL
    STUDIO_URL="https://${DOMAIN_ID}.studio.${REGION}.sagemaker.aws"
    APP_PATH="jupyterlab"
    
    link="${STUDIO_URL}/${APP_PATH}/${USER_PROFILE}/proxy/${PORT}/"
else
    # Space access - use AWS CLI to get the space URL directly
    # Get the space URL using AWS CLI
    SPACE_URL=$(aws sagemaker describe-space --domain-id "$DOMAIN_ID" --space-name "$SPACE_NAME" | jq -r '.Url' 2>/dev/null)
    
    if [ "x$SPACE_URL" = "x" ] || [ "$SPACE_URL" = "null" ]; then
        echo -e "${RED}${CURRENTDATE}: [ERROR]:${NC} Failed to retrieve Space URL" >&2
        exit 1
    fi
    
    # Extract the base URL without the path
    BASE_URL=$(echo $SPACE_URL | awk -F'/jupyterlab' '{print $1}')
    
    # Construct the proxy URL for port 8080
    link="${BASE_URL}/jupyterlab/default/proxy/${PORT}/"
fi

# Print a header and separator
echo "\n${BOLD}=== STREAMLIT APPLICATION URL ===${NC}\n"

# Display the URL in green and bold
echo "${GREEN}${BOLD}${link}${NC}"

# Print a separator
echo "\n${BOLD}=================================${NC}\n"

exit 0
