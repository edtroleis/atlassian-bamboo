# atlassian-bamboo

# Bamboo-agent-custom image

## Softwares intalled on Bamboo agent
- git
- kubectl
- az cli
- envsubs

## SSL certificate
```
replacing google.com with the FQDN of the server Bamboo is attempting to connect to

openssl s_client -connect google.com:443 -servername google.com:443 < /dev/null | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > ./certificate/public.crt
```

## Create Bamboo agent custom image
```
docker build -t <ACR_NAME>.azurecr.io/bamboo-agent-custom:1.0.0 .
```

# Run Bamboo agent custom image
```
docker run -d -v bambooAgentVolume:/home/bamboo/bamboo-agent-home --env SECURITY_TOKEN=ced9c48e72dfb2898354361892ade93729d512e6 --name="bambooAgent" -d <ACR_NAME>.azurecr.io/bamboo-agent-custom:1.0.0 "http://bamboo:8085"
```

# Startup the stack
```
# Startup
cd atlassian-stack
docker-compose -p atlassian up -d

# Stop stack
cd atlassian-stack
docker-compose -p atlassian down

# Show logs
docker-compose -p atlassian logs -f
```


# Notes

## Registries can't connect on server
[Caused by: java.net.UnknownHostException: d80cbb20f13d](https://community.atlassian.com/t5/Bamboo-questions/FATAL-ERROR-Bamboo-Remote-Agent-is-loading-constently/qaq-p/1041828)
```
On Bamboo server:
Bamboo administration > General configuration > Broken client URL

Put the container_name as below

failover:(tcp://bamboo:54663?wireFormat.maxInactivityDuration=300000)?initialReconnectDelay=15000&maxReconnectAttempts=10
```