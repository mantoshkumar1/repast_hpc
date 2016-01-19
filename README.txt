* See INSTALL.txt for installation instructions.
* Additional documentation is in the docs directory.
* RepastHPC tutorial: http://repast.sourceforge.net/hpc_tutorial/main.html

cd INSTALLATION
sh build_lib.sh
make -f Makefile all
cd ext/bin
salloc --ntasks=5
Zombies:
LD_LIBRARY_PATH=../lib mpirun -n 4 ./zombie_model zombie_config.props zombie_model.props

Rumor:
LD_LIBRARY_PATH=../lib mpirun -n 4 ./rumor_model rumor_config.props rumor_model.props

