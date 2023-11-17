FROM node:18-alpine

# create work directcory
WORKDIR /usr/myapp

# copying the dependency files to the image
COPY packag*.json .

# running the npm install command to install the dependencies
RUN npm install
RUN sudo apt-get update
RUN curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.28/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
RUN echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.28/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
RUN sudo apt-get update && sudo apt-get install -y kubectl
RUN curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
RUN sudo install minikube-linux-amd64 /usr/local/bin/minikube
RUN minikube start
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
RUN chmod u+x get_helm.sh && ./get_helm.sh

# copying all the files from the host to the container
COPY . .

# exposing the port for traffic
EXPOSE 8081

# command to run the app using CMD
CMD ["node", "app.js"]
