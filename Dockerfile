FROM debian:8

MAINTAINER Kevin Yeo <kevin.yeo@uk.fujitsu.com>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git mercurial subversion

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/archive/Anaconda3-5.0.1-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /opt/conda && \
    rm ~/anaconda.sh

RUN apt-get install -y curl grep sed dpkg && \
    TINI_VERSION=`curl https://github.com/krallin/tini/releases/latest | grep -o "/v.*\"" | sed 's:^..\(.*\).$:\1:'` && \
    curl -L "https://github.com/krallin/tini/releases/download/v${TINI_VERSION}/tini_${TINI_VERSION}.deb" > tini.deb && \
    dpkg -i tini.deb && \
    rm tini.deb && \
    apt-get clean

# Install some additional packages
RUN /opt/conda/bin/conda install -c anaconda tensorflow -y
RUN /opt/conda/bin/conda update numpy -y

RUN mkdir /opt/notebooks

WORKDIR /opt/notebooks

RUN curl "https://raw.githubusercontent.com/keviny1273/AIHackathon-AnacondawithWine/master/Wine.ipynb" > wine.ipynb

RUN mkdir /opt/start
WORKDIR /opt/start

RUN curl "https://raw.githubusercontent.com/keviny1273/AIHackathon-AnacondawithWine/master/start_jupyter.sh" > start_jupyter.sh

RUN chmod 777 start_jupyter.sh

ENV PATH /opt/conda/bin:$PATH

ENTRYPOINT [ "/usr/bin/tini", "--" ]

# Not sure which is best! However if we treat this as a server it can be harder to manage and re-use so we shall create a shell and allow th$

#CMD [ "/opt/start/start_jupyter.sh" ]
CMD [ "/bin/bash", "echo run ./start_jupyter.sh to start the jupyter notebook" ]
