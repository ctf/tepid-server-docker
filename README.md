# TEPID Docker
This is a convenient way of deploying the TEPID server and web components.

## Configuration
.gitignore files prevent you (and me) from accidentally committing config files to git

The config files for the TEPID server component are placed in ./tomcat/config/

The config files for the GitLab runner are placed in ./gitlab-runner/config/

If you need to edit the httpd config for the web component, that lives in ./web/config/

## Custom Build

Custom code for the server component can also be placed in the ./gradle/code/ directory. This will be built and deployed to the server with `docker-compose up build`

## How it Works
- tepid-server runs the application server
- couchdb is the db
- tepid-web runs the web server
- build is a gradle container which builds local code and deploys it
- ci is a gitlab-runner container which can be hooked up to a gitlab repo

### Deploying new versions
Both the `build` container and the `ci` container can deploy new versions of the server component. They do so by placing the WAR in a volume which is spanned between the containers. The tomcat contianer then automagically unpacks and deploys the WAR