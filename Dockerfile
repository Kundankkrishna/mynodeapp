FROM node:18-alpine

# create work directcory
WORKDIR ~/myapp

# copying the dependency files to the image
COPY packag*.json ~/myapp

# running the npm install command to install the dependencies
RUN npm install

# copying all the files from the host to the container
COPY . ~/myapp

# exposing the port for traffic
EXPOSE 8081

# command to run the app using CMD
CMD ["node", "app.js"]
