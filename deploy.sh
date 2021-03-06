#!/usr/bin/env bash

export DEPLOY_PATH=/home/glutenfr/ivanstanojevic.me
export HOST=gluten-free.rs
export USER=glutenfr
export PORT=2233
export ARTIFACT_NAME=artifact.tar.gz;

tar -czvf ${ARTIFACT_NAME} -T deploy.list
scp -r -P ${PORT} ${ARTIFACT_NAME} ${USER}@${HOST}:/${DEPLOY_PATH}/
rm ${ARTIFACT_NAME}

ssh ${USER}@${HOST} -p${PORT} "cd $DEPLOY_PATH && tar -xvf $ARTIFACT_NAME && rm $ARTIFACT_NAME"
