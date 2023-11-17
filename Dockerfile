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
RUN chmod +x kubectl && mkdir -p ~/.local/bin && mv ./kubectl ~/.local/bin/kubectl
RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
RUN install minikube-linux-amd64 /usr/local/bin/minikube
# RUN minikube start --driver=docker
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | sh

# copying all the files from the host to the container
COPY . .

# exposing the port for traffic
EXPOSE 8081

# command to run the app using CMD
CMD ["node", "app.js"]
