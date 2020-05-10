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

#ifndef H_Work_alucontrol_behavioral_H
#define H_Work_alucontrol_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_alucontrol_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[3];

  char t47;
  char t48;
HSimConstraints *c49;
  char t50;
HSimConstraints *c51;
    Work_alucontrol_behavioral(const char * name);
    ~Work_alucontrol_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_alucontrol_behavioral(const char *name);

#endif
