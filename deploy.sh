#!/bin/sh
if [ -z "$1" ]; then
    BRANCH=main
    DEPLOY_PATH=/usr/local/lsws/Burnly/html
    TEMP_PATH=/tmp/website
else
    BRANCH=$1
    DEPLOY_PATH=/usr/local/lsws/Burnly-Stage/html
    TEMP_PATH=/tmp/website-stage
fi

rm -rf $TEMP_PATH
git clone https://github.com/Burn-ly/website.git $TEMP_PATH
echo "Deploying $BRANCH onto $DEPLOY_PATH"
cd $TEMP_PATH
git checkout $BRANCH
rm -rf $TEMP_PATH/.git
rm -rf $DEPLOY_PATH
mv $TEMP_PATH $DEPLOY_PATH
