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
        if ( this.VC1VDEC.watermark == false ) {
                lib = "lib/vc1vdec_ti_host_M3.lib";
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

    if (Program.build.target.isa == "v7M") {
        template = "ti/sdo/codecs/vc1vdec/link.xdt";
    }

    return (template);
}
