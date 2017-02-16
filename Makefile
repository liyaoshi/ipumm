#/*
# * Copyright (c) 2011-2015, Texas Instruments Incorporated
# * All rights reserved.
# *
# * Redistribution and use in source and binary forms, with or without
# * modification, are permitted provided that the following conditions
# * are met:
# *
# * *  Redistributions of source code must retain the above copyright
# *    notice, this list of conditions and the following disclaimer.
# *
# * *  Redistributions in binary form must reproduce the above copyright
# *    notice, this list of conditions and the following disclaimer in the
# *    documentation and/or other materials provided with the distribution.
# *
# * *  Neither the name of Texas Instruments Incorporated nor the names of
# *    its contributors may be used to endorse or promote products derived
# *    from this software without specific prior written permission.
# *
# * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
# * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
# * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
# * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
# * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# */

# Repo
BIOSTOOLSROOT	?= /opt/ti
REPO		:= $(BIOSTOOLSROOT)

# Different tool versions can easily be programmed by defining below variables
# in your environment.
XDCVERSION	?= xdctools_3_32_01_22_core
BIOSVERSION	?= bios_6_46_01_38
IPCVERSION	?= ipc_3_45_00_00
CEVERSION	?= codec_engine_3_24_00_08
FCVERSION	?= framework_components_3_40_02_07
XDAISVERSION	?= xdais_7_24_00_04

# TI Compiler Settings
export TMS470CGTOOLPATH ?= $(BIOSTOOLSROOT)/ccsv6/tools/compiler/ti-cgt-arm_5.2.7

# Define where the sources are
DUCATIDCEMMSRC	= $(shell pwd)
TIVIDEOTOOLSROOT ?= $(BIOSTOOLSROOT)

# Generate the full package paths for tools
BIOSPROD	= $(REPO)/$(BIOSVERSION)
CEPROD		= $(TIVIDEOTOOLSROOT)/$(CEVERSION)
FCPROD		= $(TIVIDEOTOOLSROOT)/$(FCVERSION)
XDAISPROD	= $(REPO)/$(XDAISVERSION)

# XDC settings
export XDCBUILDCFG = $(DUCATIDCEMMSRC)/build/config.bld

XDCDIST_TREE	= $(REPO)/$(XDCVERSION)
export XDCROOT	= $(XDCDIST_TREE)

export XDCPATH  = $(BIOSPROD)/packages;$(IPCSRC)/packages;$(CEPROD)/packages;$(FCPROD)/packages;$(XDAISPROD)/packages;$(DUCATIDCEMMSRC)/extrel/ti/ivahd_codecs/packages;$(DUCATIDCEMMSRC)/src;$(DUCATIDCEMMSRC);

# Custom settings for build
JOBS		?= 1
# Set profile, always set as release version. Alternate option is "debug"
PROFILE		?= release
# Set debug/trace level from 0 to 4
TRACELEVEL	?= 0
# Offloads core to sysm3 code
OFFLOAD		?= 1
# Set to Non-SMP by default
FORSMP		?= 0
# Set Instrumentation to be allowed (ENABLE to enable it)
SETINST		?= ENABLE
# Set HW revision type- OMAP5:ES20, VAYU:ES10
HWVERSION   ?= ES10
# Set if Profiler needs to ON or OFF for the build
PROFILER    ?= DISABLE

all: ducatibin

lib: ducatilib

# Include platform build configuration
config:
ifeq (bldcfg.mk,$(wildcard bldcfg.mk))
include bldcfg.mk
else
	@echo "No config selected. Please configure the build first and then try to build."
	@echo "For more info, use 'make help'"
	@exit 1
endif

unconfig:
	@echo "Removed existing configuration"
	@rm -f bldcfg.mk

vayu_smp_config: unconfig
	@echo "Creating new config\c"
	@echo DUCATI_CONFIG = vayu_smp_config > bldcfg.mk
	@echo ".\c"
	@echo MYXDCARGS=\"profile=$(PROFILE) trace_level=$(TRACELEVEL) hw_type=VAYU hw_version=$(HWVERSION) BIOS_type=SMP prof_type=$(PROFILER)\" >> bldcfg.mk
	@echo ".\c"
	@echo CHIP = VAYU >> bldcfg.mk
	@echo ".\c"
	@echo FORSMP = 1 >> bldcfg.mk
	@echo ".\c"
	@echo DUCATIBINNAME = "dra7-ipu2-fw.xem4" >> bldcfg.mk
	@echo INTBINNAME = "ipu.xem4" >> bldcfg.mk
	@echo ".\c"
	@echo QNXDUCATIBINNAME = "dra7xx-m4-ipu2.xem4" >> bldcfg.mk
	@echo QNXINTBINNAME = "qnx_ipu.xem4" >> bldcfg.mk
	@echo ".\c"
	@echo "done"

omap5_smp_config: unconfig
	@echo "Creating new config\c"
	@echo DUCATI_CONFIG = omap5_smp_config > bldcfg.mk
	@echo ".\c"
	@echo MYXDCARGS=\"profile=$(PROFILE) trace_level=$(TRACELEVEL) hw_type=OMAP5 hw_version=$(HWVERSION) BIOS_type=SMP prof_type=$(PROFILER)\" >> bldcfg.mk
	@echo ".\c"
	@echo CHIP = OMAP5 >> bldcfg.mk
	@echo ".\c"
	@echo FORSMP = 1 >> bldcfg.mk
	@echo ".\c"
	@echo DUCATIBINNAME = "omap5-ipu-fw.xem4" >> bldcfg.mk
	@echo INTBINNAME = "ipu.xem4" >> bldcfg.mk
	@echo ".\c"
	@echo QNXDUCATIBINNAME = "omap5-m4-ipu.xem4" >> bldcfg.mk
	@echo QNXINTBINNAME = "qnx_ipu.xem4" >> bldcfg.mk
	@echo ".\c"
	@echo "done"

clean: config
	export XDCARGS=$(MYXDCARGS); \
	 $(XDCROOT)/xdc --jobs=$(JOBS) clean -PD $(DUCATIDCEMMSRC)/platform/ti/dce/baselib/.; \
	 $(XDCROOT)/xdc --jobs=$(JOBS) clean -PD $(DUCATIDCEMMSRC)/platform/ti/dce/baseimage/.

buildlib: config
ifeq ($(IPCSRC),)
	@echo "ERROR: IPCSRC not set. Exiting..."
	@echo "For more info, use 'make help'"
	@exit 1
else ifeq ($(TMS470CGTOOLPATH),)
	@echo "ERROR: TMS470CGTOOLPATH not set. Exiting..."
	@echo "For more info, use 'make help'"
	@exit 1
endif
	export XDCARGS=$(MYXDCARGS); \
	$(XDCROOT)/xdc --jobs=$(JOBS) -PD $(DUCATIDCEMMSRC)/platform/ti/dce/baselib/.

build: config
ifeq ($(IPCSRC),)
	@echo "ERROR: IPCSRC not set. Exiting..."
	@echo "For more info, use 'make help'"
	@exit 1
else ifeq ($(TMS470CGTOOLPATH),)
	@echo "ERROR: TMS470CGTOOLPATH not set. Exiting..."
	@echo "For more info, use 'make help'"
	@exit 1
endif
	export XDCARGS=$(MYXDCARGS); \
	$(XDCROOT)/xdc --jobs=$(JOBS) -PD $(DUCATIDCEMMSRC)/platform/ti/dce/baselib/.; \
	$(XDCROOT)/xdc --jobs=$(JOBS) -PD $(DUCATIDCEMMSRC)/platform/ti/dce/baseimage/.

ducatilib: buildlib

ducatibin: build
ifeq ($(FORSMP),1)
	$(TMS470CGTOOLPATH)/bin/armstrip -p $(DUCATIDCEMMSRC)/platform/ti/dce/baseimage/out/ipu/$(PROFILE)/$(INTBINNAME) -o=$(DUCATIBINNAME)
	$(TMS470CGTOOLPATH)/bin/armstrip -p $(DUCATIDCEMMSRC)/platform/ti/dce/baseimage/out/ipu/$(PROFILE)/$(QNXINTBINNAME) -o=$(QNXDUCATIBINNAME)
else
	@echo "***********Not yet implemented************"
endif

info: tools sources custom
tools:
	@echo "REPO    := $(REPO)"
	@echo "XDC     := $(XDCDIST_TREE)"
	@echo "BIOS    := $(BIOSPROD)"
	@echo "FC      := $(FCPROD)"
	@echo "CE      := $(CEPROD)"
	@echo "XDAIS   := $(XDAISPROD)"
	@echo "TMS470CGTOOLPATH := $(TMS470CGTOOLPATH)"
	@echo " "

sources:
	@echo "IPC  := $(IPCSRC)"
	@echo " "

	@echo "DUCATIDCEMMSRC  := $(DUCATIDCEMMSRC)"
	@echo "DUCATIDCEMMSRC info: $(shell git --git-dir=$(DUCATIDCEMMSRC)/.git --work-tree=$(DUCATIDCEMMSRC)/ log --pretty=format:'%ad %h %d' --oneline --date=short -1 )"
	@echo "DUCATIMMSRC describe: $(shell git --git-dir=$(DUCATIDCEMMSRC)/.git --work-tree=$(DUCATIDCEMMSRC)/ describe --dirty)"
	@echo " "

custom:
	@echo "JOBS       := $(JOBS)"
	@echo "PROFILE    := $(PROFILE)"
	@echo "TRACELEVEL := $(TRACELEVEL)"
	@echo "OFFLOAD    := $(OFFLOAD)"
	@echo "FORSMP     := $(FORSMP)"
	@echo "SETINST    := $(SETINST)"
	@echo "HWVERSION  := $(HWVERSION)"
	@echo "PROFILER   := $(PROFILER)"
	@echo " "
	@echo "Ducati configuration used:  $(DUCATI_CONFIG)"
	@echo "Ducati binary name:         $(DUCATIBINNAME)"
	@echo "QNX Ducati binary name:     $(QNXDUCATIBINNAME)"
	@echo " "

help:
	@echo " "
	@echo "Please export the following variables: "
	@echo " 1. BIOSTOOLSROOT - Directory where all the BIOS tools are installed."
	@echo "                    If not mentioned, picks up the default, /opt/ti"
	@echo " 2. TMS470CGTOOLPATH - TMS470 ARM Code Generation Tools installation path"
	@echo "                       If not mentioned, tries the default install location, /opt/ti/TI_CGT_TI_ARM_5.0.1"
	@echo " 3. IPCSRC - Absolute path of the $(IPCVERSION)"
	@echo " 4. [Optional] - Any of the following variables can be defined to customize your build."
	@echo "       JOBS       - To specify the number of parallel build jobs (default is 1)"
	@echo "       PROFILE    - 'release' or 'debug' profile for the libraries and binaries (default is release)"
	@echo "       TRACELEVEL - From 0 to 4. Higher the value, more the traces. 0 implies no traces (default is 0)"
	@echo "       OFFLOAD    - Enable offloading support (default is 1, set to 0 to disable)"
	@echo " 5. [Optional] - Any of the following variables can be defined to change the default tool versions."
	@echo "       XDCVERSION       = $(XDCDIST_TREE)"
	@echo "       BIOSVERSION      = $(BIOSPROD)"
	@echo "       IPCVERSION       = $(IPCSRC)"
	@echo "       CEVERSION        = $(CEPROD)"
	@echo "       FCVERSION        = $(FCPROD)"
	@echo "       XDAISVERSION     = $(XDAISPROD)"
	@echo "       TMS470CGTOOLPATH = $(TMS470CGTOOLPATH)"
	@echo " "
	@echo "Use the appropriate make targets from the following: "
	@echo "  Configure Platform: "
	@echo "     OMAP5 (SMP)       - export HWVERSION=ES20 && make omap5_smp_config"
	@echo "     VAYU/J6 (SMP)     - export HWVERSION=ES10 && make vayu_smp_config"
	@echo "  Build:               - make"
	@echo "  Clean:               - make clean"
	@echo "  Generate Binary: "
	@echo "     Firmware        - make ducatibin"
	@echo "  Information: "
	@echo "     Tools           - make tools"
	@echo "     Sources         - make sources"
	@echo "     Custom          - make custom"
	@echo "     all 3           - make info"
	@echo "  Others: "
	@echo "     Check config    - make config"
	@echo "     Clean config    - make unconfig"
	@echo " "
