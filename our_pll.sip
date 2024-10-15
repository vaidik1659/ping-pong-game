set_global_assignment -entity "our_pll" -library "lib_our_pll" -name IP_TOOL_NAME "altera_pll"
set_global_assignment -entity "our_pll" -library "lib_our_pll" -name IP_TOOL_VERSION "22.1"
set_global_assignment -entity "our_pll" -library "lib_our_pll" -name IP_TOOL_ENV "mwpim"
set_global_assignment -library "lib_our_pll" -name SPD_FILE [file join $::quartus(sip_path) "our_pll.spd"]

set_global_assignment -library "lib_our_pll" -name MISC_FILE [file join $::quartus(sip_path) "our_pll_sim/our_pll.vho"]
