/*
 *  ======== package.xs ========
 *
 */

/*
 *  ======== getLibs ========
 */
function getLibs(prog)
{
    var lib = null;
  
    if (prog.build.target.isa == "v7M" || prog.build.target.isa == "v7M4") {        
        if ( this.MPEG2VDEC.watermark == false ) {
                lib = "lib/mpeg2vdec_ti_host.lib;lib/ivahd_ti_api_vM3.lib";
        }
        else {
                lib = null;
        }
        print("    will link with " + this.$name + ":" + lib);
    }
    return (lib);
}

/*
 *  ======== getSects ========
 */
function getSects()
{
    var template = null;

    if (prog.build.target.isa == "v7M" || prog.build.target.isa == "v7M4") {
        template = "ti/sdo/codecs/mpeg2vdec/link.xdt";
    }

    return (template);
}
