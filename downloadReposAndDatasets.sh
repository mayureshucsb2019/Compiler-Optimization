#!/bin/bash

# Download Tigr and make
git clone git@github.com:albalaka/Tigr.git
cd Tigr && make && make -f Test_Makefile && cd -

#Download and make weighted version of graph for Higgs
if [ ! -f "Tigr/datasets/Higgs/higgs-social_network.edgelist" ]; then
	cd Tigr/datasets/Higgs && make && cd - 
fi
if [ ! -f "Tigr/datasets/Higgs/higgs-social_network.edgelist_weighted" ]; then
	cd Tigr/datasets/Higgs && python make_weighted_graph.py && cd -
fi

# Download and make weighted version of graph for Pokec
if [ ! -f "Tigr/datasets/Pokec/soc-pokec-relationships.txt" ]; then
	cd Tigr/datasets/Pokec && make && cd - 
fi
if [ ! -f "Tigr/datasets/Pokec/soc-pokec-relationships.txt_weighted" ]; then
	cd Tigr/datasets/Pokec && python make_weighted_graph.py && cd -
fi

# Download and make weighted version of graph for Amazon 
if [ ! -f "Tigr/datasets/Amazon/amazon0601.txt" ]; then
	cd Tigr/datasets/Amazon && wget https://snap.stanford.edu/data/amazon0601.txt.gz && gunzip amazon0601.txt.gz && dos2unix amazon0601.txt && cd - 
fi
if [ ! -f "Tigr/datasets/Amazon/amazon0601.txt_weighted" ]; then
	cd Tigr/datasets/Amazon && python make_weighted_graph.py && cd -
fi


# Download CuSha and make
git clone git@github.com:koa-sato/CuSha.git
cd CuSha && ./sfBuild.sh && cd -
