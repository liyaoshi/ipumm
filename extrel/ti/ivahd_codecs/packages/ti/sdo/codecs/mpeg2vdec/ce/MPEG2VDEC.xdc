/*!
 *  ======== MPEG2VDEC========
 *  MPEG2VDEC codec specification
 *
 *  This file specifies information necessary to integrate with the Codec
 *  Engine.
 *
 *  By inheriting ti.sdo.ce.video3.IVIDDEC3, MPEG2VDEC declares that it "is
 *  a" video3 algorithm.  This allows the codec engine to automatically
 *  supply simple stubs and skeletons for transparent execution of DSP
 *  codecs by the GPP.
 *
 *  In addition to declaring the type of the MPEG2VDEC algorithm, we
 *  declare the external symbol required by xDAIS that identifies the
 *  algorithms implementation functions.
 */
metaonly module MPEG2VDEC inherits ti.sdo.ce.video3.IVIDDEC3
{
    readonly config ti.sdo.codecs.mpeg2vdec.MPEG2VDEC.Module alg =
        ti.sdo.codecs.mpeg2vdec.MPEG2VDEC;
    
    override readonly config String ialgFxns = "MPEG2VDEC_TI_IMPEG2VDEC";

    override readonly config String iresFxns = "MPEG2VDEC_TI_IRES";

}
