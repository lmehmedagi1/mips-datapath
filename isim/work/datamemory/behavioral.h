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

#ifndef H_Work_datamemory_behavioral_H
#define H_Work_datamemory_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_datamemory_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[6];

  HSimArrayType Mem_arraybase;
  HSimArrayType Mem_array;
  char *t71;
    HSim__s1 SA[1];
    Work_datamemory_behavioral(const char * name);
    ~Work_datamemory_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_datamemory_behavioral(const char *name);

#endif
