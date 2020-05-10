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

#ifndef H_Work_signextend_behavioral_H
#define H_Work_signextend_behavioral_H
#ifdef __MINGW32__
#include "xsimMinGW.h"
#else
#include "xsim.h"
#endif


class Work_signextend_behavioral: public HSim__s6 {
public:

    HSim__s1 SE[2];

HSimConstraints *c32;
HSimConstraints *c33;
  char *t34;
HSimConstraints *c35;
HSimConstraints *c36;
    Work_signextend_behavioral(const char * name);
    ~Work_signextend_behavioral();
    void constructObject();
    void constructPorts();
    void reset();
    void architectureInstantiate(HSimConfigDecl* cfg);
    virtual void vhdlArchImplement();
};



HSim__s6 *createWork_signextend_behavioral(const char *name);

#endif
