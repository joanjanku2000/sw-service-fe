# Swisscom Front End App

## Tech Stack
- Angular


The primary goal is to model and manage a 
‘Service‘ entity, which contains a list of
Resource objects. 
Each ‘Resource‘ includes a list of ‘Owner‘ objects.

To run the application Docker must be installed.
## Project Setup
Using Bash Script
``./local_setup.sh``


Stop the containers:   ``docker compose down``


Inside the repo can be found also a "fe_script.sh" which can be
used as a standalone script (without cloning the repo yourself)
and is used in Hostinger Ubuntu Host to trigger the deployment of the front-end service.

The script does everything itself as follows:

- Checks for the repository folder in the folder it is run, if found deletes it - to ensure code is uddated
- clones the repository and cd inside it
- checks for docker and docker compose , and installs them if they are not present
- runs docker compose up --build which sets up front-end


Github Actions is used to trigger a workflow, which is defined inside  `.github/workflows/deploy/yml`.
The workflow is triggered on each push and using the HOST, USER and SSH_KEY inside
the configured VM (they are stored as secrets in github secrets section), it executes
the fe_script.sh which is found in the host machine.

Through this step, with each commit we get a mini simulated simple version of CI/CD.


## Production Deployment
Project is deployed and can be accessed through the URL:
``http://62.72.33.67``.
Each push , activates the Github workflow, which
triggers the fe_setup.sh script in the virtual machine to get the new code,
 re-build and re-start the containers.

Thank you :)

