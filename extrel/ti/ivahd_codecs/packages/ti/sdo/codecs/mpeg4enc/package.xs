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
        if ( this.MPEG4ENC.watermark == false ) {
                lib = "lib/mpeg4venc_ti_host.lib";
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

    if (Program.build.target.isa == "v7M" || Program.build.target.isa == "v7M4") {
        template = "ti/sdo/codecs/mpeg4enc/link.xdt";
    }

    return (template);
}
