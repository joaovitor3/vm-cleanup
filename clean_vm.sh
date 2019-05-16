#!/bin/bash
USERNAME=teste
HOSTS=111.111.11.111
SCRIPT="docker system prune -a -f"
ID_RSA=/path/to/id_rsa
for HOSTNAME in ${HOSTS} ; do
    ssh -i ${ID_RSA} -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done
