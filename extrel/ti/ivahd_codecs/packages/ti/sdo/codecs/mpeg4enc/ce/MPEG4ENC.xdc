/*!
 *  ======== MPEG4ENC========
 *  MPEG4ENC codec specification
 *
 *  This file specifies information necessary to integrate with the Codec
 *  Engine.
 *
 *  By inheriting ti.sdo.ce.video2.IVIDENC2, MPEG4ENC declares that it "is
 *  a" video2 algorithm.  This allows the codec engine to automatically
 *  supply simple stubs and skeletons for transparent execution of DSP
 *  codecs by the GPP.
 *
 *  In addition to declaring the type of the MPEG4ENC algorithm, we
 *  declare the external symbol required by xDAIS that identifies the
 *  algorithms implementation functions.
 */
metaonly module MPEG4ENC inherits ti.sdo.ce.video2.IVIDENC2
{
    readonly config ti.sdo.codecs.mpeg4enc.MPEG4ENC.Module alg =
        ti.sdo.codecs.mpeg4enc.MPEG4ENC;
    
    override readonly config String ialgFxns = "MPEG4ENC_TI_IMPEG4ENC";

    override readonly config String iresFxns = "MPEG4ENC_TI_IRES";

}
