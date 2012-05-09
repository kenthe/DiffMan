#include "mex.h"
#include <math.h>
#include <float.h>
#include "matrix.h"

/* This file - mtimes.c - implements a more general version than the
 * m-file: mtimes.m. The m-file has to be corrected so that it
 * supports only legal matrix-multiplications, which this mexbased
 * file does. */

void mexFunction(int nlhs, mxArray *plhs[],
		 int nrhs, const mxArray *prhs[])
{
  const mxArray   *udata, *wdata;
  mxArray         *ptr_shape, *ptr_data, *ptr_obj;
  double          *umat, *vmat, *wmat;
  int             i, j, k, l;
  int             wdimm, wdimn, vdimm, vdimn, udimm, udimn, n, nmat;
  int             nd_u, nd_v, wdim[2];
  const int       *udim, *vdim;
  const int       nod = 2;

  nd_u = mxGetNumberOfDimensions(prhs[0]);
  nd_v = mxGetNumberOfDimensions(prhs[1]);
  
  if ((nd_u > 2) || (nd_v > 2))
    mexErrMsgTxt("Function does not support number-of-dims > 2!");
  
  /* Make sure that multiplication is done correctly!! */
  if (mxGetN(prhs[0]) == mxGetM(prhs[1])) {
    
    if (mxIsDouble(prhs[1])) {

      vmat  = mxGetPr(prhs[1]);
      udata = prhs[0];

      vdim = mxGetDimensions(prhs[1]);
      udim = mxGetDimensions(prhs[0]);
      
      wdim[0] = udim[0]; wdim[1] = vdim[1];
      wdimm = wdim[0];   wdimn = wdim[1];
      vdimm = vdim[0];   vdimn = vdim[1];
      udimm = udim[0];   udimn = udim[1];

      plhs[0] = mxDuplicateArray(udata);       /* This is OUTPUT object array   */
      mxSetDimensions(plhs[0],wdim,nod);       /* Reshape OUTPUT object array   */

      n    = wdimm*wdimn;                      /* Total number of objects       */
      nmat = mxGetNumberOfElements(mxGetField(prhs[0],0,"data"));
      
      /* Initializing all matrices in all the objects in the OUTPUT array
	 to zero */
      ptr_shape = mxGetFieldByNumber(plhs[0],0,0);
      ptr_data  = mxGetFieldByNumber(plhs[0],0,1);
      ptr_obj   = mxGetFieldByNumber(plhs[0],0,2);
      /* Initializing the matrix data of the object to zero */
      wmat      = mxGetPr(ptr_data);
      for (j = 0; j < nmat; j++)
	wmat[j] = 0.0;
      
      for (i = 0; i < n; i++) {   
	mxSetFieldByNumber(plhs[0],i,0,mxDuplicateArray(ptr_shape));
	mxSetFieldByNumber(plhs[0],i,1,mxDuplicateArray(ptr_data));
	mxSetFieldByNumber(plhs[0],i,2,mxDuplicateArray(ptr_obj));
      }

      for (k = 0; k < wdimm; k++) {
	for (l = 0; l < wdimn; l++) {
	  wdata   = mxGetField(plhs[0],k+l*wdimm,"data");
	  wmat    = mxGetPr(wdata); 
	  for (i = 0; i < udimn; i++) 
	    {
	      umat = mxGetPr(mxGetField(udata,k + i*udimm,"data"));
	      if (umat) {
		for (j = 0; j < nmat; j++)
		  wmat[j] += vmat[i+l*vdimm] * umat[j]; 
	      } else {
		mexPrintf("mtimes.c: line ~ 80: Ptr corrupt!\n");}
	    }
	}  
      }
    }
    else if (mxIsDouble(prhs[0])) {    /* double-matrise X obj-matrise */

      vmat  = mxGetPr(prhs[0]);
      udata = prhs[1];
      
      vdim = mxGetDimensions(prhs[0]);
      udim = mxGetDimensions(prhs[1]);
      
      wdim[0] = vdim[0]; wdim[1] = udim[1];
      wdimm = wdim[0];   wdimn = wdim[1];
      vdimm = vdim[0];   vdimn = vdim[1];
      udimm = udim[0];   udimn = udim[1];

      plhs[0] = mxDuplicateArray(udata);       /* This is OUTPUT object array   */
      mxSetDimensions(plhs[0],wdim,nod);       /* Reshape OUTPUT object array   */
      
      n    = wdimm*wdimn;                      /* Total number of objects       */
      nmat = mxGetNumberOfElements(mxGetField(prhs[1],0,"data"));
      
      /* Initializing all matrices in all the object in the OUTPUT array
	 to zero */
      ptr_shape = mxGetFieldByNumber(plhs[0],0,0);
      ptr_data  = mxGetFieldByNumber(plhs[0],0,1);
      ptr_obj   = mxGetFieldByNumber(plhs[0],0,2);
      /* Initializing the matrix data of the object to zero */
      wmat      = mxGetPr(ptr_data);
      for (j = 0; j < nmat; j++)
	wmat[j] = 0.0;
      
      for (i = 0; i < n; i++) {   
	mxSetFieldByNumber(plhs[0],i,0,mxDuplicateArray(ptr_shape));
	mxSetFieldByNumber(plhs[0],i,1,mxDuplicateArray(ptr_data));
	mxSetFieldByNumber(plhs[0],i,2,mxDuplicateArray(ptr_obj));
      }

      for (k = 0; k < wdimm; k++) {
	for (l = 0; l < wdimn; l++) {
	  wdata   = mxGetField(plhs[0],k+l*wdimm,"data");
	  wmat    = mxGetPr(wdata); 
	  for (i = 0; i < vdimn; i++) 
	    {
	      umat = mxGetPr(mxGetField(udata,i + l*udimm,"data")); 
	      if (umat) {
		for (j = 0; j < nmat; j++) 
		  wmat[j] += vmat[k+i*vdimm] * umat[j];
	      } else {
		mexPrintf("mtimes.c: line ~ 130: Ptr corrupt!\n");}
	    }
	}	  
      }
    }
    return;
  }
  else {
    mexErrMsgTxt("Check sizes: columns(left matrix) != rows(right matrix)!");
  }
}
