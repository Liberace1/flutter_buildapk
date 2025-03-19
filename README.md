# flutter_buildapk
This repo contains a bash script that runs a dockerfile which then installs dependency, builds the apk and spit the artifact into a folder called /output


## How to:
Clone repo inside your flutter project
cd into folder && run bash script


## Troublehsoot
You may have errors no such file found if you dont put the whole-folder in your flutter workdir, so just make slight changes to file path in the dockerfile to point to corret files
