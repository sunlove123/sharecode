FROM eclipse-temurin:17-ubi9-minimal

RUN microdnf install -y git && wget https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz && tar xvf apache-maven-3.9.4-bin.tar.gz && microdnf install -y vim
ENV M2_HOME=/apache-maven-3.9.4
ENV M2=$M2_HOME/bin
ENV PATH=$M2:$PATH

COPY dep /root
RUN chmod -R 777 /root/.m2

EXPOSE 9080 7777 9443
ENTRYPOINT ["tail", "-f", "/dev/null"]
