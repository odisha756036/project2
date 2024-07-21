# Use CentOS 8 as the base image
FROM centos:latest

# Metadata and labels
LABEL Name="Trilochan Karan" \
      Email="trilochankaran94@gmail.com"

# Update YUM repos to use vault.centos.org
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*.repo && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*.repo

# Update packages and install necessary tools
RUN dnf -y update && \
    dnf -y install httpd \
                   wget \
                   zip \
                   unzip

# Download and extract website templa
WORKDIR /var/www/html
RUN wget  https://www.free-css.com/assets/files/free-css-templates/download/page296/little-fashion.zip
RUN unzip little-fashion.zip
RUN     mv /var/www/html/little-fashion/2127_little_fashion/* /var/www/html/ && \
        rm -rf  *.zip \
        rm -rf 
        rm -rf 2127_little_fashion
CMD     ["/usr/sbin/httpd", "-D", "FOREGROUND"]
EXPOSE  80
