#Load environment
FROM continuumio/miniconda3

# Sign as the author
LABEL maintainer="Shadi Boomi <shadi.boomi@gmail.com>"

#Define workspace
WORKDIR /app

# Set path to conda
ENV PATH /root/anaconda3/bin:$PATH

# Update conda
RUN conda update -n base -c defaults conda

# Install some packages
RUN conda install -c anaconda numpy
RUN conda install -c anaconda scikit-learn
RUN conda install -c conda-forge matplotlib
RUN conda install -c conda-forge pandas
RUN conda install -c conda-forge seaborn


# Jupyter listens port: 8888
EXPOSE 8888
# Run Jupyter notebook as Docker main process
CMD ["jupyter", "notebook", "--ip='*'", "--port=8888", "--no-browser", "--allow-root"]