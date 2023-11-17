FROM bitnami/kubectl:latest
FROM rancher/helm-controller:v0.15.4
FROM node:18-alpine

# create work directcory
WORKDIR /usr/myapp

# copying the dependency files to the image
COPY packag*.json .

# running the npm install command to install the dependencies
RUN npm install

# copying all the files from the host to the container
COPY . .

# exposing the port for traffic
EXPOSE 8081

# command to run the app using CMD
CMD ["node", "app.js"]
