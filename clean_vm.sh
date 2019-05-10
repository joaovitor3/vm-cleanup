#!/bin/bash
USERNAME=${USERNAME}
HOSTS=${HOSTS}
SCRIPT=${SCRIPT}
ID_RSA=${ID_RSA}
for HOSTNAME in ${HOSTS} ; do
    ssh -i ${ID_RSA} -l ${USERNAME} ${HOSTNAME} "${SCRIPT}"
done
