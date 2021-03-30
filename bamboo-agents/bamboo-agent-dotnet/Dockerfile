FROM atlassian/bamboo-agent-base

USER root

COPY ./certificate/public.crt $JAVA_HOME/jre/lib/security

RUN apt-get update && \
    apt-get install git -y && \
    apt install nuget -y && \
    apt-get install wget -y && \
    wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb -O packages-microsoft-prod.deb && dpkg -i packages-microsoft-prod.deb && apt-get install -y apt-transport-https && apt-get update && apt-get install -y dotnet-sdk-5.0 && \
    cd $JAVA_HOME/jre/lib/security && keytool -keystore cacerts -storepass changeit -noprompt -trustcacerts -importcert -alias ldapcert -file public.crt && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER ${BAMBOO_USER}
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.git.executable" /usr/bin/git
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.nuget.executable" /usr/bin/nuget
RUN ${BAMBOO_USER_HOME}/bamboo-update-capability.sh "system.dotnet.executable" /usr/bin/dotnet