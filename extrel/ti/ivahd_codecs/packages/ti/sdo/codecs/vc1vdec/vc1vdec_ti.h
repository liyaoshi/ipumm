/*
*******************************************************************************
* HDVICP2.0 Based VC-1 Decoder
* 
* "HDVICP2.0 Based VC-1 Decoder" is a software module developed on TI's 
* HDVICP2 based SOCs. This module is capable of decoding a compressed 
* advanced/main/simple profile VC-1 bit-stream into a YUV 4:2:0 Raw video.
* Based on SMPTE-421M standard. 
* Copyright (C) 2009 Texas Instruments Incorporated - http://www.ti.com/ 
* ALL RIGHTS RESERVED 
*******************************************************************************
*/
/**
*******************************************************************************
* @file  vc1vdec_ti.h
*
* @brief   This file contains the various defines for the interface.
* 
* @author: Krishnakanth Rapaka  
*
* @version 0.0 (Feb 2008) : Base version created        [Krishnakanth Rapaka]
*
* @version 0.1 (May 2010) : Modified according to latest interface standard.
*                                                       [Dinesh Anand]
*
* @version 0.2 (Jun 2010) : Added review comments.      [Dinesh Anand]
*                           
*******************************************************************************
*/
#ifndef VC1VDEC_TI_
#define VC1VDEC_TI_

/*******************************************************************************
*                               INCLUDE FILES                                               
*******************************************************************************/
#include "ivc1vdec.h"


/*******************************************************************************
*                               MACROS                                               
*******************************************************************************/



/*******************************************************************************
*              PUBLIC DECLARATIONS Note: Defined here, used elsewhere
*******************************************************************************/

/**
********************************************************************************
*  @struct VC1VDEC_Handle
*
*  @brief   This pointer is used to reference all VC1VDEC instance objects.
*
*  @note    None
*
********************************************************************************
*/  
typedef struct IVC1VDEC_Obj *VC1VDEC_Handle;

/**
********************************************************************************
*  @typedef VC1VDEC_Params
*
*  @brief   This structure defines the creation parameters for all VC1VDEC 
*           objects.
*
*  @note    None
*
********************************************************************************
*/  
typedef IVC1VDEC_Params VC1VDEC_Params;

/**
********************************************************************************
*  @typedef VC1VDEC_DynamicParams
*
*  @brief   This structure defines the creation parameters for all VC1VDEC 
*           objects.
*
*  @note    None
*
********************************************************************************
*/  
typedef IVC1VDEC_DynamicParams VC1VDEC_DynamicParams;

/**
********************************************************************************
*  @struct VC1VDEC_Status
*
*  @brief   This structure store the status of the the run time parameters for
*           objects.
*
*  @note    None
*
********************************************************************************
*/  
typedef struct IVC1VDEC_Status   VC1VDEC_Status;

/**
********************************************************************************
*  @typedef VC1VDEC_OutArgs
*
*  @brief   This structure defines output arguments for all VC1VDEC objects.
*           objects.
*
*  @note    None
*
********************************************************************************
*/  
typedef IVC1VDEC_OutArgs VC1VDEC_OutArgs;

/**
********************************************************************************
*  @struct VC1VDEC_OutArgs
*
*  @brief   This structure defines input arguments for all VC1VDEC objects.
*           objects.
*
*  @note    None
*
********************************************************************************
*/  
typedef struct IVC1VDEC_InArgs   VC1VDEC_InArgs;

/**
********************************************************************************
*  @typedef VC1VDEC_Cmd
*
*  @brief   This typedef defines the control commands for VC1VDEC objects.
*
*  @note    None
*
********************************************************************************
*/  
typedef IVIDDEC3_Cmd   VC1VDEC_Cmd;



/** 
 *******************************************************************************
 *  @fn     VC1VDEC_create(const IVC1VDEC_Fxns *fxns, 
 *                             const VC1VDEC_Params *prms)
 *
 *  @brief  Creates an VC1VDEC instance object. 
 *
 *  @param[in] fxns  : IVC1VDEC function pointer
 *
 *  @param[in] prms  : IVDEC param structure pointer
 *
 *  @note   None
 *
 *******************************************************************************
*/
VC1VDEC_Handle VC1VDEC_create(const IVC1VDEC_Fxns *fxns, 
                              const VC1VDEC_Params *prms);

/** 
 *******************************************************************************
 *  @fn     VC1VDEC_control(VC1VDEC_Handle handle, 
 *                   VC1VDEC_Cmd cmd,
 *                   VC1VDEC_DynamicParams *params, 
 *                   VC1VDEC_Status *status)
 *
 *  @brief  Get,set,and change the parameters of the VC1VDEC function. 
 *
 *  @param[in] handle  : VC1 instance handle
 *
 *  @param[in] cmd  : control command
 *
 *  @param[in] params  : Dynamic param structure pointer
 *
 *  @param[in] status  : VC1 status structure pointer
 *
 *  @note   None
 *
 *******************************************************************************
*/
Int VC1VDEC_control(VC1VDEC_Handle handle, 
                    VC1VDEC_Cmd cmd,
                    VC1VDEC_DynamicParams *params, 
                    VC1VDEC_Status *status);

/** 
 *******************************************************************************
 *  @fn     VC1VDEC_delete(VC1VDEC_Handle handle)
 *
 *  @brief  Deletes the VC1VDEC instance object specified by handle. 
 *
 *  @param[in] handle  : VC1 instance handle
 *
 *  @note   None
 *
 *******************************************************************************
*/
Void VC1VDEC_delete(VC1VDEC_Handle handle);

/**
********************************************************************************
 *  @fn     VC1VDEC_TI_decode(IVIDDEC3_Handle    handle,
 *                           XDM2_BufDesc       *inptr,
 *                           XDM2_BufDesc       *outptr,
 *                           IVIDDEC3_InArgs    *inargs,
 *                           IVIDDEC3_OutArgs   *outargs)
 *
 *  @brief  TI's(Texas Instrument) implementation of the process API defined
 *          by XDM for the VC-1 Decoder.This process function is responsible 
 *          for the decode of a given frame.
 *
 *  @param  handle
 *          Handle to an algorithm instance object
 * 
 *  @param  *inptr
 *          Pointer to input buffer structure.
 * 
 *  @param  *outptr
 *          Pointer to output buffer structure. 
 * 
 *  @param  *inargs
 *          Pointer to input arguments structure.
 * 
 *  @param  *outargs
 *          Pointer to output arguments structure.
 *
 *  @return XDM_EOK/XDM_EFAIL     
********************************************************************************
*/
Int VC1VDEC_decode(VC1VDEC_Handle handle, 
                   XDM2_BufDesc *inptr,
                   XDM2_BufDesc *outptr, 
                   VC1VDEC_InArgs *inarg, 
                   VC1VDEC_OutArgs *outarg);


/*******************************************************************************
*            EXTERNAL REFERENCE Note: use only if not found in header file
*******************************************************************************/


/*
* TI's implementation of the IALG interface for VC1VDEC
*/
extern IALG_Fxns VC1VDEC_TI_IALG;

/*
* TI's implementation of the IVC1VDEC interface
*/
extern IVC1VDEC_Fxns VC1VDEC_TI_IVC1VDEC;


#endif


