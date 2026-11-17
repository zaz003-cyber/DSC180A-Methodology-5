ARG BASE_CONTAINER=ghcr.io/ucsd-ets/datascience-notebook:2023.4-notebook7
FROM ${BASE_CONTAINER}

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends aria2 nmap traceroute \
    && rm -rf /var/lib/apt/lists/*

USER jovyan
# Keep NumPy compatible with the SciPy version in the course image.
RUN python -m pip install --no-cache-dir 'numpy<1.23' geopandas babypandas==0.1.5

CMD ["/bin/bash"]
