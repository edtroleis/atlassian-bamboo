# atlassian-bamboo

# Bamboo-agent-custom image

## Softwares intalled on Bamboo agent
- git
- kubectl
- az cli
- envsubs

## Create Bamboo agent custom image
```
docker build -t bamboo-agent-custom .
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
