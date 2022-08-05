FROM centos:7

#Import necessary scripts and conf files
#(conf files will be in readonly shared folder afterwards)
RUN mkdir /slurm_rpm && mkdir /var/log/slurm/
RUN useradd slurm
RUN mkdir /opt/SLURM && chown -R -H slurm /opt/SLURM
COPY ./etc/slurm_rpm/ /slurm_rpm/

#Install munge for slurm and all required rpms
RUN yum install epel-release munge munge-libs munge-devel libnsl mariadb mariadb-devel -y
RUN yum install ./slurm_rpm/* -y
COPY ./etc/munge/* /etc/munge/

#Cleanup after install
RUN rm -d -r /slurm_rpm

##RUN yum clean all
##This ^ command makes the image heavyer for some reason...##
RUN rm -d -r /var/cache/*
RUN rm -r /tmp/*

COPY ./etc/script.sh /script.sh
CMD [ "/script.sh" ] 
