# docker-rabbitmq
docker image to deploy rabbitmq cluster on mesos with one marathon app.

Marathon config example:

```
{
  "id": "/rabbitmq",
  "instances": 3,
  "constraints": [
    ["hostname", "UNIQUE"]
  ],
  "env": {
    "RABBITMQ_ERLANG_COOKIE": {
      "secret":"secret0"
     },
    "RABBITMQ_DEFAULT_USER": "admin",
    "RABBITMQ_DEFAULT_PASS": {
      "secret":"secret1"
     }
  },
  "container": {
    "type": "DOCKER",
    "volumes": [],
    "docker": {
      "image": "johndohoney/rabbitcluster"
    },
      "volumes": [
      {
        "containerPath": "/var/lib/rabbitmq",
        "hostPath": "/var/lib/rabbitmq",
        "mode": "RW"
      }
    ],
    "portMappings": []
  },
  "cpus": 1,
  "mem": 1024,
  "requirePorts": false,
  "secrets":{
     "secret0":{
        "source":"rabbitmq/cookie"
     },
     "secret1":{
       "source":"rabbitmq/password"
     }
  },
  "networks": [
    {
      "mode": "container",
      "name": "dcos"
    }
  ]
}

```
