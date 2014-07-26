#!/bin/bash
#
#

# include ctoys_base.lib

t_test_local=0

if [ $t_test_local -eq 1 ] ; then
 if [ -f "../cluster-toys-common/usr/share/ctoys/ctoys_base.lib" ] ; then
  source "../cluster-toys-common/usr/share/ctoys/ctoys_base.lib"
 else
  echo "please install ctoys_base.lib first"
  exit 1
 fi
else
 if [ -f "/usr/share/ctoys/ctoys_base.lib" ] ; then
  source "/usr/share/ctoys/ctoys_base.lib"
 else
  echo "please install ctoys_base.lib first"
  exit 1
 fi
fi

CT_DEBUG=1
CT_VERBOSE=1
CT_TEST=0
CT_SILENT=0
CT_LOGGING=0
CT_FORCE=0

CT_LOGFILE='test_ctoys_base.lib.log'
CT_LOGGING=1

ct_settings

ct_exec "${CTT[RSYNC]}"
ct_log "log test"

ct_activate_colors 0

ct_info "info test"
ct_verbose "verbose test"
ct_debug "debug test"
ct_warn "warn test"
ct_error "test error"
ct_exec "${CTT['RSYNC']}"

ct_activate_colors 1

ct_info "info test"
ct_verbose "verbose test"
ct_debug "debug test"
ct_warn "warn test"
ct_error "test error"
ct_exec "${CTT['RSYNC']}"

ct_retcode=0
ct_check_tool 'SH'
t_found="${CT_COLOR_RED}not found${CT_COLOR_TEXT}"
if [ $ct_retcode -eq 0 ] ; then
 t_found="${CT_COLOR_GREEN}found${CT_COLOR_TEXT}"
fi
ct_info "CTT[$i_key] -> ${CTT[$i_key]} $t_found"

t_test="   kakk    kdk      "

t_lala=`ct_trim $t_test`

echo "t_test ($t_test): xxx${t_test}xxx"
echo "t_trimmed: xxx${t_lala}xxx"

ct_check_tool 'lol' Required

