#include "mex.h"
#include <math.h>
#include <float.h>
#include "matrix.h"

/* v = [a,b] */
void commutator(double *v, double *a, double *b, int n)
{
  int    i, j, k;

  for (j = 0; j < n; j++) 
    for (k = 0; k < n; k++) 
      for (i = 0; i < n; i++)
	v[i+j*n] += a[i+k*n]*b[k+j*n] - b[i+k*n]*a[k+j*n];
  return;
}

void aux_dexpinv(double *v, double *a, double *b, double *ord, int n)
{
  int    order = *ord, i;
  double *c, *oldc;
  const double B1  = -0.5;                    /* B1  = -1/2         */
  const double B2  =  8.333333333333333e-02;  /* B2  =  1/12        */
  const double B4  = -1.388888888888889e-03;  /* B4  = -1/720       */
  const double B6  =  3.306878306878307e-05;  /* B6  =  1/30240     */
  const double B8  = -8.267195767195768e-07;  /* B8  = -1/1209600   */
  const double B10 =  2.087675698786810e-08;  /* B10 =  5/239500800 */
  
  if (order >= 13) {   /* Test this first. Ord >= 13 dont calculate */
    mexPrintf("Sorry, dexpinv is only implemented up to order 12.\n");
    return; }

  c    = mxMalloc(n*n*sizeof(double));
  oldc = mxMalloc(n*n*sizeof(double));
  for (i = 0; i < n*n; i++) {
    c[i] = 0.0; }                 /* Initializes work array c to zero */
  
  if (order < 2)
    return;

  commutator(c,a,b,n);
  for (i = 0; i < n*n; i++) {
    v[i]   += B1*c[i];
    oldc[i] = c[i];
    c[i]    = 0.0; }
  if (order < 3)
    return;
 
  commutator(c,a,oldc,n);
  for (i = 0; i < n*n; i++) {
    v[i]   += B2*c[i];
    oldc[i] = c[i];
    c[i]    = 0.0; }
  if (order < 5)
    return;

  commutator(c,a,oldc,n);
  for (i = 0; i < n*n; i++) { oldc[i] = c[i]; c[i] = 0.0; }
  commutator(c,a,oldc,n);
  for (i = 0; i < n*n; i++) {
    v[i]   += B4*c[i];
    oldc[i] = c[i];
    c[i]    = 0.0; }
  if (order < 7)
    return;
  
  commutator(c,a,oldc,n);
  for (i = 0; i < n*n; i++) { oldc[i] = c[i]; c[i] = 0.0; }
  commutator(c,a,oldc,n);
  for (i = 0; i < n*n; i++) {
    v[i]   += B6*c[i];
    oldc[i] = c[i];
    c[i]    = 0.0; }
  if (order < 9)
    return;

  commutator(c,a,oldc,n);
  for (i = 0; i < n*n; i++) { oldc[i] = c[i]; c[i] = 0.0; }
  commutator(c,a,oldc,n);
  for (i = 0; i < n*n; i++) {
    v[i]   += B8*c[i];
    oldc[i] = c[i];
    c[i]    = 0.0; }
  if (order < 11)
    return;

  commutator(c,a,oldc,n);
  for (i = 0; i < n*n; i++) { oldc[i] = c[i]; c[i] = 0.0; }
  commutator(c,a,oldc,n);
  for (i = 0; i < n*n; i++) {
    v[i]   += B10*c[i];
    oldc[i] = c[i];
    c[i]    = 0.0; }
  if (order < 13)
    return;
}

void mexFunction(int nlhs, mxArray *plhs[],
		 int nrhs, const mxArray *prhs[])
{
  const mxArray   *adata, *bdata;
  mxArray         *vdata;
  double          *amat, *bmat, *vmat, *ord;
  double          isabelian;
  int             n, i;

  adata = mxGetField(prhs[0],0,"data");
  bdata = mxGetField(prhs[1],0,"data");
  ord   = mxGetPr(prhs[2]);               /* Order of dexpinv approx  */
  n     = mxGetN(adata);                  /* Assume all matrices square */
  
  /* Tests on the input data objects has to be added */
  
  amat = mxGetPr(adata);  /* Ptr to matrix data of A obj */
  bmat = mxGetPr(bdata);  /* Ptr to matrix data of B obj */
  
  plhs[0] = mxDuplicateArray(prhs[0]);    /* This is OUTPUT object    */
  vdata   = mxGetField(plhs[0],0,"data"); /* ptr to OUTPUT data field */ 
  vmat    = mxGetPr(vdata);               /* ptr to where data starts */

  for (i = 0; i < n*n; i++)        /* Initializing output array to b */
    vmat[i] = bmat[i];

  /* Maa kalle "isabelian"-funken */
  isabelian = 0.0;

  if (isabelian == 1)
    return;
  else 
    aux_dexpinv(vmat, amat, bmat, ord, n);  /* Call to comp. routine */
  return;
}
