FROM atlassian/bamboo-agent-base

USER root

COPY ./certificate/public.crt $JAVA_HOME/jre/lib/security

RUN apt-get update && \
    apt-get install git -y && \
    curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && chmod +x ./kubectl && mv ./kubectl /usr/local/bin/kubectl && \
    curl -sL https://aka.ms/InstallAzureCLIDeb | bash && \
    apt-get install gettext-base && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    cd $JAVA_HOME/jre/lib/security && keytool -keystore cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias ldapcert -file public.crt

USER ${BAMBOO_USER}
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.git.executable" /usr/bin/git
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.kubectl.executable" /usr/local/bin/kubectl
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.az.executable" /usr/bin/az
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.envsubst.executable" /usr/bin/envsubst