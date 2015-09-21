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
        if ( this.HDVICP20API.watermark == false ) {
                lib = "lib/ivahd_ti_api_vM3.lib";
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
        template = "ti/sdo/codecs/hdvicp20api/link.xdt";
    }

    return (template);
}
