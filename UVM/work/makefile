
UVM_HOME=/opt/eda/synopsys/vcs-mx/O-2018.09-SP2-1/etc/uvm-1.1

include ../bin/Makefile.vcs

TEST=npu_random_test

PAT_DIR_BASE    =  ../tb
PAT_DIR = $(PAT_DIR_BASE)/$(PAT_NAME)
#COV
CM = -cm line+cond+fsm+branch+tgl
#CM = -cm line+cond+fsm+branch+tgl -cm_hier vcs_cov.cfg -cm_nocasedef
CM_NAME = -cm_name simv
CM_DIR = -cm_dir ./cov/$(TEST).vdb
CM_NODEF = -cm_nocasedef
#CM_DIR = -cm_dir ./cov/$(PAT_NAME)/covdir.vdb
#urg -full64 -dir tc1.vdb tc2.vdb -dbname merged.vdb -report urgReport

#ASSERTION
ASS_ON  = +define+SVA+ASSERT_ON
ASS_RUN = +sva_success 

#SEED
SEED = 1

#GUI
GUI =
all:clean comp run

comp:
	$(VCS)	-f filelist.f -l comp.log $(CM) $(CM_NAME) $(CM_DIR) $(ASS_ON) 

run:
	$(SIMV) $(GUI) +UVM_TESTNAME=$(TEST) +ntb_random_seed=$(SEED) $(CM) $(CM_DIR) $(CM_NAME) $(ASS_RUN) 
	echo "***PAT_NAME = $(TEST) ***" >> vcs.log 

save:
	@cp *.fsdb wave/$(TEST).fsdb

viewcov:
	urg -full64 -format both -dir cov/$(TEST).vdb
	firefox urgReport/dashboard.html

mergecov:
	urg -full64 -dir ./cov/*.vdb -dbname merged.vdb -report urgReport
	firefox urgReport/dashboard.html

verdi:
	verdi -f filelist.f -ssf ./simtop.fsdb #-sswr signal.rc

clean: 
	rm -rf *.log csrc simv *.daidir *.key *.h *.swp *.fsdb *.fsdb.* *.sv
