FROM node:18-alpine

# create work directcory
WORKDIR /usr/myapp

# copying the dependency files to the image
COPY packag*.json .

# running the npm install command to install the dependencies
RUN npm install
RUN apk add --update
RUN apk add -v curl openssl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | sh
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sh

# copying all the files from the host to the container
COPY . .

# exposing the port for traffic
EXPOSE 8081

# command to run the app using CMD
CMD ["node", "app.js"]
