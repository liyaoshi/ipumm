/*
********************************************************************************
* HDVICP2.0 Based MPEG-2 MP Decoder
*
* "HDVICP2.0 Based MPEG-2 MP Decoder" is software module developed on TI's
* HDVICP2 based SOCs. This module is capable of generating a raw 4:2:0 video
* data by de-compressing/decoding a main/simple profile bit-stream based on
* ISO/IEC 13818-2.
* Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/
* ALL RIGHTS RESERVED
********************************************************************************
*/

/**
********************************************************************************
* @file      mpeg2vdec_ti.h
*
* @brief     This file provides definisions for the interface handles.
*
* @author    Prashanth
*
* @version 0.0 (March 2008) : Created  [Prashanth]
* @version 0.1 (Dec 2009)   : Added MPEG2VDEC_TI_IRES[Deepa]
* @version 0.2 (Feb 2010)   : Coding Guidelines[Deepa]
*
********************************************************************************
*/


#ifndef __MPEG2VDEC_TI__
#define __MPEG2VDEC_TI__

/* ---------------------- compilation control switches ---------------------- */

/*******************************************************************************
*   INCLUDE FILES
*******************************************************************************/
/* ---------------------- system and platform files ------------------------- */
#include <ti/xdais/xdas.h>
#include <ti/xdais/ialg.h>
#include <ti/xdais/dm/ividdec3.h>

/* --------------------------- program files -------------------------------- */
#include "impeg2vdec.h"

/*******************************************************************************
*   EXTERNAL REFERENCES NOTE : only use if not found in header file
*******************************************************************************/
/* -------------------------- data declarations ----------------------------- */
/**
* Referene to external symbol MPEG2VDEC_TI_IALG, holding the pointers to the
* all the basic algorithm creation related functions.
*/
extern IALG_Fxns    MPEG2VDEC_TI_IALG;

/**
* Referene to external symbol MPEG2VDEC_TI_IMPEG2VDEC,holding the pointers to
* the all the mpeg2 decoder algorithm interfaces
*/
extern IMPEG2VDEC_Fxns    MPEG2VDEC_TI_IMPEG2VDEC;

/**
* Referene to external symbol MPEG2VDEC_TI_IRES, holding the pointers to the
* all the basic RMAN-IRES reource related functions.
*/
extern IRES_Fxns    MPEG2VDEC_TI_IRES;

/* ------------------------- function prototypes ---------------------------- */

/*******************************************************************************
*   PUBLIC DECLARATIONS Defined here, used elsewhere
*******************************************************************************/
/* ------------------------- data declarations ------------------------------ */
/* ------------------------- function prototypes ---------------------------- */

/*******************************************************************************
*   PRIVATE DECLARATIONS Defined here, used only here
*******************************************************************************/
/* ------------------------ data declarations ------------------------------- */
/* ----------------------- function prototypes ------------------------------ */

/* ------------------------------ macros ------------------------------------ */

#endif /* #ifndef __MPEG2VDEC_TI__ */

