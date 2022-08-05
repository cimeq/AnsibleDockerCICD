# AnsibleDockerCICD
This docker was made to be able to use ansible in CICD tool like jenkins.

# Usage
Localy you can do:

## Build
```
docker build --tag salco/ansible-docker-cicd:lastest --no-cache --rm -f ./Dockerfile .
```

## Tests
```
docker run --name dockeransible -ti --rm --volume /tmp/project-with-ansible-playbook:/tmp/test salco/ansible-docker-cicd:lastest
```

# Jenkins
Here is an example in a `Jenkinsfile`.

> TBD
