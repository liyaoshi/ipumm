/*!
 *  ======== VC1VDEC========
 *  VC1VDEC codec specification
 *
 *  This file specifies information necessary to integrate with the Codec
 *  Engine.
 *
 *  By inheriting ti.sdo.ce.video3.IVIDDEC3, VC1VDEC declares that it "is
 *  a" video3 algorithm.  This allows the codec engine to automatically
 *  supply simple stubs and skeletons for transparent execution of DSP
 *  codecs by the GPP.
 *
 *  In addition to declaring the type of the VC1VDEC algorithm, we
 *  declare the external symbol required by xDAIS that identifies the
 *  algorithms implementation functions.
 */
metaonly module VC1VDEC inherits ti.sdo.ce.video3.IVIDDEC3
{
    readonly config ti.sdo.codecs.vc1vdec.VC1VDEC.Module alg =
        ti.sdo.codecs.vc1vdec.VC1VDEC;
    
    override readonly config String ialgFxns = "VC1VDEC_TI_IVC1VDEC";

    override readonly config String iresFxns = "VC1VDEC_TI_IRES";

}
