#include <stdlib.h>
#include "matrix.h"
#include <math.h>
#include "mex.h"

void commutator(double *v, double *a, double *b, int n)
{
  int    i, j, k;

  for (i = 0; i < n*n; i++) { v[i] = 0.0; }

  for (j = 0; j < n; j++) 
    for (k = 0; k < n; k++) 
      for (i = 0; i < n; i++)
	v[i+j*n] += a[i+k*n]*b[k+j*n] - b[i+k*n]*a[k+j*n];
  return;
}

void mexFunction(int nlhs, mxArray *plhs[],
		 int nrhs, const mxArray *prhs[])
{
  mxArray    *ptr, *outptr[1], *inptr[2], *arg_1[1];
  mxArray    *mp1, *mp2;
  double     *dptr;
  double     *start_pr, *a_start, *b_start;
  const char *class_name;
  int        n;
    
  ptr = (mxArray *)mexGetArrayPtr("DMARGCHK","global");

  if (ptr == NULL)
    mexErrMsgTxt("Could not read global variable DMARGCHK.\n");
  else {
    inptr[0] = (mxArray *)prhs[0];
    inptr[1] = (mxArray *)prhs[1];
    arg_1[0] = (mxArray *)prhs[0];
    dptr = (double *)mxGetPr(ptr);
    if (*dptr == 1) {
      /* Check for proper number of arguments. */
      if ((nrhs != 2)||(nlhs != 1)) {
	mexErrMsgTxt("Wrong number of input/output arguments!");}
      /* Check arguments for having same shape. */
      mexCallMATLAB(1,outptr,2,inptr,"sameshape");
      dptr = (double *)mxGetPr(outptr[0]);
      if (*dptr == 0) {
	mexErrMsgTxt("Arguments do not have the same shape!");}
    }
  }
  
  mexCallMATLAB(1,outptr,1,arg_1,"isabelian");
  dptr = (double *)mxGetPr(outptr[0]);
  if (*dptr == 1) {
    mexCallMATLAB(1,plhs,1,arg_1,"zero");
    return;
  }

  mexCallMATLAB(1,outptr,1,arg_1,"hasmatrix");
  dptr = (double *)mxGetPr(outptr[0]);
  if (*dptr == 1) {
    if (mxIsStruct(prhs[0]) && mxIsStruct(prhs[1])) {

      mp1 = mxGetField(prhs[0],0,"data");
      mp2 = mxGetField(prhs[1],0,"data");

      n       = mxGetN(mp1);
      a_start = (double *)mxGetPr(mp1);
      b_start = (double *)mxGetPr(mp2);

      plhs[0]  = mxDuplicateArray(prhs[0]);
      start_pr = (double *)mxGetPr(mxGetField(plhs[0],0,"data"));
      
      commutator(start_pr,a_start,b_start,n);
      return;
    }
  }

  class_name = mxGetClassName(prhs[0]);
  mexPrintf("Function not defined in class: %s",class_name);
  return;
}

  
