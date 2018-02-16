# AIHackathon-Anaconda
Docker container for Anaconda for Machine Learning

This Docker image contains an Anaconda installation that includes Python 3, Tensorflow, Jupyter Notebook and a good selection of Machine Learning and Python Libraries.

It also includes an example Jupyter Notebook that provides an easy introduction to machine learning, by mixing code with mark-up. The example looks at several ways to predict wine quality based on several measurable qualities. Note - Wine Tasting is largely based on personal taste!! 

# Running the Example

To make things easy, we have provided a docker container that includes everything you need to run the example without having the issues of ensuring all the required libraries are installed on your system. However we have also provided the Jupiter Notebook within this repository too, if you want to set up the environment yourself as well as the orignal Dockerfile. 

Docker can run on both Windows and Linux, so you just need to find yourself a box to run it on!

# Setting up Docker

To install Docker on windows - follow the following link - https://docs.docker.com/toolbox/toolbox_install_windows/

To install Docker on Linux - we recommend running the following - `wget -qO- https://get.docker.com/ | sh`

# Running the Container

Having managed to get docker running (simple right?) and run the docker Hello World project you should be good to go with running this docker container.

As the container is published on docker hub - https://hub.docker.com/r/keviny101/aihackathon-anacondawithwine/ all you now need to do to run the container is 

`docker pull keviny101/aihackathon-anacondawithwine`

This will pull down the container. Now you need to run the container using the following command which will start the Jupyter Notebook.

 `docker run -p 8888:8888 --name anacondawithwine -i -t keviny101/aihackathon-anacondawithwine`

Using the instructions in the container, connect to your box using the url provided with the token and open the wine.ipynb file and away you go!!

If you are connecting to the Jupyter notebook remotely, you'll need to replace the internal (loopback) address with the public ip address for your server.

# Caution - Corporate Firewalls

Currently due to the way the Jupyter Notebook server works, we are having some trouble connecting to it via corporate networks, sorry! Check out our reverse proxy container, which if run afterwards can provide a root around this problem!

# Data sources

The project uses public data from the University of California, Irvine (UCI) machine learning repository - https://archive.ics.uci.edu/ml/machine-learning-databases

# Thanks!

If you have any comments or feedback, please let us know!!! Enjoy!
