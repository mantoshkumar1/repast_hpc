****************************** Target Machine : lxlogin5.lrz.de **********************
*******  How to use the system *******
1. How to fetch the code
2. How to build the system
3. How to execute the program
*************************************
**************************************************************************************


**************************************************************************************
1. How to fetch the code
**************************************************************************************
$ module load git
$ git clone https://gitlab.lrz.de/ga78boj/hpcLabProjectRepastHPC.git



**************************************************************************************
2. How to build the system
**************************************************************************************
(Patience: It would take around 15-20 minutes)

$ cd hpcLabProjectRepastHPC/INSTALLATION
$ sh build_lib.sh
$ make -f Makefile all
$ cd ../ext/bin/
$ cp ../../scripts/execute_app.sh ./



**************************************************************************************
3. How to execute the program
**************************************************************************************
Here I assume you are already in 'hpcLabProjectRepastHPC/ext/bin' directory.

$ salloc --ntasks=80

Change your application configuration here. Most important are (proc.per.x) and  (proc.per.y).
$ vim ../../src/zombies/model.props

$ sh execute_app.sh NUM_PROCESS
(Note: NUM_PROCESS = ((proc.per.x) X (proc.per.y)) is an integer)

$ module load cube

$ cd scorep_zombie_model_NUM_PROCESS_sum
(Note: NUM_PROCESS is an integer that we had calculated in above step)

$ cube profile.cubex

