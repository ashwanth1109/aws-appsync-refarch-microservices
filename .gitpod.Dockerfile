FROM gitpod/workspace-full

# More information: https://www.gitpod.io/docs/config-docker/
# install tools needed to build and deploy app from devspaces
RUN npm install -g aws-cdk
RUN sudo apt-get update
RUN sudo apt-get install chromium-browser -y
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && sudo ./aws/install
RUN npm install -g typescript
RUN npm install -g ts-node
RUN mkdir ~/.aws \
    && touch ~/.aws/credentials \
    && touch ~/.aws/config
RUN wget -O- https://apt.corretto.aws/corretto.key | sudo apt-key add - 
RUN sudo add-apt-repository 'deb https://apt.corretto.aws stable main'
RUN sudo apt-get update; sudo apt-get install -y java-11-amazon-corretto-jdk
