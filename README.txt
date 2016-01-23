**************************************************************************************
*******  How to use the system *******
1. How to fetch the code
2. How to build the system
3. How to execute the program
*************************************
**************************************************************************************


**************************************************************************************
1. How to fetch the code
**************************************************************************************
module load git
git clone https://gitlab.lrz.de/ga78boj/hpcLabProjectRepastHPC.git



**************************************************************************************
2. How to build the system (Please read suggestion carefully)

(Suggestion: system is already built and this step could be skipped
             But if you insist on making a fresh system build, follow the following steps.
             Warning: It would take around 15-20 mintues)
**************************************************************************************
cd INSTALLATION
sh build_lib.sh
make -f Makefile all
cd ../ext/bin/
cp ../../scripts/execute_app.sh .



**************************************************************************************
3. How to execute the program
**************************************************************************************
Here I assume you are already in 'hpcLabProjectRepastHPC/ext/bin' directory

salloc --ntasks=40
sh execute_app.sh NUM_PROCESS     (NUM_PROCESS is an integer)
module load cube
cd scorep_zombie_model_4_sum
cube profile.cubex

