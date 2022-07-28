# Lazybox

> "I choose a lazy person to do a hard job. Because a lazy person will find an easy way to do it."
-Bill Gates

Lazybox is a set of small shell scripts to perform common development activities. No need to remember all the commands needed to generate a self signed certificate, Lazybox has you covered.

## Scripts and Utilities 

### Generate Self-Signed CSR & Cert

Simply run generate-selfsigned.sh and the script will generate 4 files in the script directory suitable for a server running localy. You will recieve a server.key and a a certificate.crt file ready to use in most web servers. This script also generates a pem file suitable for apache and ready to be imported into a jks for tomcat. The CSR is also left in the folder should you need it to get the certificate minted else where.

Default Cert settings are as follows:

- Common Name: localhost
- Country: United States
- State: Laziness
- City: Lazytown
- Organination: Lazy Nerds
- Organization Unit: Department of Lazy


### Docker Enter

A simple script that can be used to enter a docker container by it's image name. This is useful when trying to debug unnamed containers as every time the container restarts a new id is assigned to the container requring the user to run a ``docker ps`` to get the new id before running ``docker exec -it <container_id> /bin/bash`` to enter a bash shell in the container. The easiest way to use this is to add an alias to your bashrc file such as ``alias docker-enter="sudo ~/location/of/script/docker-enter.sh"``