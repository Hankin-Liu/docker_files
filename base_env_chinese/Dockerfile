FROM centos:7
MAINTAINER hankin "wojiaoliuhuajun@126.com"

# yum res 
RUN yum -y install epel-release \ 
&& yum -y update \ 
&& yum -y install sudo \ 
&& yum clean all -y 

# developer
RUN yum -y groups install "Development Tools" \ 
&& yum -y install cmake htop gtest vim wget which net-tools valgrind perf lsof collectl oprofile telnet \ 
&& yum -y install --setopt=tsflags='' man man-pages \
                           && debuginfo-install -y glibc \
                           && yum clean all -y


# chinese
                           RUN yum -y groups install "Fonts" \
                               && yum clean all -y

                               RUN localedef -i zh_CN -f UTF-8 zh_CN.UTF-8 \ 
                               && localedef -i zh_CN -f GB18030 zh_CN.GB18030 \
                                   && localedef -i zh_CN -f GB2312 zh_CN.GB2312 \
                                   && localedef -i zh_CN -f GBK zh_CN.GBK 

                                   ENV LC_ALL en_US.UTF8
                                   ENV LANG zh_CN.UTF8

# default cmd
                                   CMD ["/bin/bash"]
