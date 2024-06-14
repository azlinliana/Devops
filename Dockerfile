# Docker for Jenkins

FROM jenkins/jenkins:lts

# Switch to the root user to install depenedencies
USER root

# Copy the DevOpsJenkins directory to the specified location in the container
COPY DevOpsJenkins /usr/local/DevOpsJenkins

# Create the .ssh directory with proper permissions - Ensure only root user can read from, write to or execute files within directory
RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh

# Update the package list and install required packages
RUN apt-get update && \
  apt-get install -y lsb-release curl gnupg git python3

RUN apt-get update && apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

RUN install -m 0755 -d /etc/apt/keyrings && \
  curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
  chmod a+r /etc/apt/keyrings/docker.asc && \
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    
# Update the package list again and install Docker CLI
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Switch back to the jenkins user
USER jenkins