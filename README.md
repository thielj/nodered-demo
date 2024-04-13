# nodered-demo

A containerized Node-RED app, demonstrating a few simple features (APIs,
MQTT message broker, HTTP requests, XML parsing, cron scheduler, inject
and debug nodes, ...).

Note that this demo is only using public resources and hasn't set
a password to protect credentials. Please keep this in mind if you add
any crdentials later.

## Using an existing Node-RED instance

If you have a running Node-RED instance with the "Projects" feature enabled,
simply clone this repository and hit "Deploy" in the upper right corner.

## Using Dockerfile to build and run this app

This project includes a `Dockerfile` with build instructions. Chances are, all you
need to do is:

```
docker build -t nodered-demo https://github.com/thielj/nodered-demo.git#main
sudo docker run -it --rm -p 1080:1080 nodered-demo
```

After the build finishes, running the container should produce an output similar to this:

```
13 Apr 18:25:04 - [info]

Welcome to Node-RED
===================

13 Apr 18:25:04 - [info] Node-RED version: v3.1.9
13 Apr 18:25:04 - [info] Node.js  version: v18.20.2
13 Apr 18:25:04 - [info] Linux 6.1.0-13-amd64 x64 LE
13 Apr 18:25:05 - [info] Loading palette nodes
13 Apr 18:25:06 - [info] Settings file  : /data/settings.js
13 Apr 18:25:06 - [info] Context store  : 'default' [module=memory]
13 Apr 18:25:06 - [info] User directory : /data
13 Apr 18:25:06 - [warn] Projects disabled : editorTheme.projects.enabled=false
13 Apr 18:25:06 - [info] Flows file     : /data/flows.json
13 Apr 18:25:06 - [warn]

---------------------------------------------------------------------
Your flow credentials file is encrypted using a system-generated key.

If the system-generated key is lost for any reason, your credentials
file will not be recoverable, you will have to delete it and re-enter
your credentials.

You should set your own key using the 'credentialSecret' option in
your settings file. Node-RED will then re-encrypt your credentials
file using your chosen key the next time you deploy a change.
---------------------------------------------------------------------

13 Apr 18:25:06 - [info] Server now running at http://127.0.0.1:1880/
13 Apr 18:25:06 - [warn] Encrypted credentials not found
13 Apr 18:25:06 - [info] Starting flows
13 Apr 18:25:06 - [info] Started flows
```

If this is your local docker setup, you can now access the Node-RED GUI
at http://127.0.0.1:1880/

To stop the container, hit `CTRL-C`. It should be removed automatically.
To remove the image and clean up any cached layers, use:

```
sudo docker image rm nodered-demo
```

If you have cloned the repository, build it from the clone instead:

```
docker build -t nodered-demo .
```

## Using docker-compose.yml to build and run this app

The included `docker-compose.yml` makes some assumptions about your setup,
most importantly an existing docker network named `proxy`. It also adds
a few label useful for running this with the Traefik router/proxy. YMMV.

Once you sorted this out, it should be sufficient to simply execute the
following from within the nodered-demo folder:

```
sudo docker compose up -d
```

This should pull a pre-built image from GitHub Packages and spin up a
container named `nodered-demo-nodered-demo-1`.

To view logs, run nodered-demo-nodered-demo-1

```
sudo docker logs nodered
```

To stop the container, run:

```
sudo docker compose down
```


If you want to build your own image, try this. It uses the above mentioned
`Dockerfile` and should give you a similar result.

```
docker compose build
```
