# Piped-Portainer-Docker

This config assumes you're already running Portainer and using a Caddy server as a reverse-proxy. This allows you to spin up the Piped server in its own stack, and proxy the web interface through your existing Caddy server.

## Setup

1. Run `./configure-instance.sh` and enter the url hostnames for the frontend, backend, and proxy urls (make sure to add A or CNAME records for these urls that resolve to your server). You'll also set a password for your Postgres database here too (it's worth knowing this, but it shouldn't be exposed to the outside world).
2. View the `./caddy.docker-compose.yml` and add the indicated lines to your `docker-compose.yml` for your existing Caddy server (usually this means editting the stack config in Portainer).
3. Copy the contents of `./Caddyfile-append` and paste it into the end of your Caddyfile configuration.
4. Restart your Caddy server stack or container in Portainer.
5. Create a new stack in Portainer, using the contents of the `./portainer.docker-compose.yml` file (you shouldn't need to change anything here).
6. Start your Piped stack in Portainer.

## Updating

I prefer to use Portainer to manually update docker containers. You can update the entire stack by navigating to the editor tab for the Piped stack (don't actually change anything), click the "Update the stack" button and check the "Re-Pull image and redeploy" option.

Alternatively, you can navigate to each container and use the "Recreate" button with the "Re-pull image" option.

## Credits

This is a modified version of the [Piped-Docker](https://github.com/TeamPiped/Piped-Docker) config.

You can view the project for this app [here](https://github.com/TeamPiped/Piped) and even make a [donation to the developers](https://github.com/TeamPiped/Piped#donations) if you found this project useful.
