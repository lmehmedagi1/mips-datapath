////////////////////////////////////////////////////////////////////////////////
//   ____  ____   
//  /   /\/   /  
// /___/  \  /   
// \   \   \/  
//  \   \        Copyright (c) 2003-2004 Xilinx, Inc.
//  /   /        All Right Reserved. 
// /---/   /\     
// \   \  /  \  
//  \___\/\___\
////////////////////////////////////////////////////////////////////////////////

#ifndef H_Work_datapath_testbench_vhd_behavior_H
#define H_Work_datapath_testbench_vhd_behavior_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_datapath_testbench_vhd_behavior: public HSim__s6 {
public:


    HSim__s1 SA[3];
    Work_datapath_testbench_vhd_behavior(const char * name);
    ~Work_datapath_testbench_vhd_behavior();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_datapath_testbench_vhd_behavior(const char *name);

#endif
