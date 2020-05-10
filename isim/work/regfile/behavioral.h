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

#ifndef H_Work_regfile_behavioral_H
#define H_Work_regfile_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_regfile_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[8];

  HSimArrayType Mem_arraybase;
  HSimArrayType Mem_array;
  char *t14;
    HSim__s1 SA[1];
  int t15;
  char *t16;
    Work_regfile_behavioral(const char * name);
    ~Work_regfile_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_regfile_behavioral(const char *name);

#endif
