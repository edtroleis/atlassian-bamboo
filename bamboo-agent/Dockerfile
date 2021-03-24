# docker run -it --name bamboAgentCustom --rm --env SECURITY_TOKEN=ced9c48e72dfb2898354361892ade93729d512e6 bamboo-agent-custom2 "http://bamboo:8085" bash

FROM atlassian/bamboo-agent-base
USER root
RUN apt-get update && \
    apt-get install git -y && \
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# apt-get install azure-cli -y && \

USER ${BAMBOO_USER}
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.git.executable" /usr/bin/git
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.kubectl.executable" /usr/local/bin/kubectl
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.kubectl.executable" /usr/local/bin/kubectl
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.az.executable" /usr/bin/az
