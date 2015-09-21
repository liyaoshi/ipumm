/*!
 *  ======== MPEG4VDEC========
 *  MPEG4VDEC codec specification
 *
 *  This file specifies information necessary to integrate with the Codec
 *  Engine.
 *
 *  By inheriting ti.sdo.ce.video3.IVIDDEC3, MPEG4VDEC declares that it "is
 *  a" video3 algorithm.  This allows the codec engine to automatically
 *  supply simple stubs and skeletons for transparent execution of DSP
 *  codecs by the GPP.
 *
 *  In addition to declaring the type of the MPEG4VDEC algorithm, we
 *  declare the external symbol required by xDAIS that identifies the
 *  algorithms implementation functions.
 */
metaonly module MPEG4VDEC inherits ti.sdo.ce.video3.IVIDDEC3
{
    readonly config ti.sdo.codecs.mpeg4vdec.MPEG4VDEC.Module alg =
        ti.sdo.codecs.mpeg4vdec.MPEG4VDEC;
    
    override readonly config String ialgFxns = "MPEG4VDEC_TI_IMPEG4VDEC";

    override readonly config String iresFxns = "MPEG4VDEC_TI_IRES";

}
