#!/bin/bash

# This script modifies the UFW firewall
# config to DROP blocked packets rather than rejecting.
#
# It also causes UFW to block ICMP pings, and other packets

SED="sed -i"
RULES_CONFIG=/etc/ufw/before.rules
HANDLE=DROP

REPLACE_INPUT_DESTINATION_UNREACHABLE="s/^#\?.*ufw-before-input.*destination-unreachable.*$/-A ufw-before-input -p icmp --icmp-type destination-unreachable -j $HANDLE/"
REPLACE_INPUT_TIME_EXCEEDED="s/^#\?.*ufw-before-input.*time-exceeded.*$/-A ufw-before-input -p icmp --icmp-type time-exceeded -j $HANDLE/"
REPLACE_INPUT_PARAMETER_PROBLEM="s/^#\?.*ufw-before-input.*parameter-problem.*$/-A ufw-before-input -p icmp --icmp-type parameter-problem -j $HANDLE/"
REPLACE_INPUT_ECHO_REQUEST="s/^#\?.*ufw-before-input.*echo-request.*$/-A ufw-before-input -p icmp --icmp-type echo-request -j $HANDLE/"

REPLACE_FORWARD_DESTINATION_UNREACHABLE="s/^#\?.*ufw-before-forward.*destination-unreachable.*$/-A ufw-before-input -p icmp --icmp-type destination-unreachable -j $HANDLE/"
REPLACE_FORWARD_TIME_EXCEEDED="s/^#\?.*ufw-before-forward.*time-exceeded.*$/-A ufw-before-input -p icmp --icmp-type time-exceeded -j $HANDLE/"
REPLACE_FORWARD_PARAMETER_PROBLEM="s/^#\?.*ufw-before-forward.*parameter-problem.*$/-A ufw-before-input -p icmp --icmp-type parameter-problem -j $HANDLE/"
REPLACE_FORWARD_ECHO_REQUEST="s/^#\?.*ufw-before-forward.*echo-request.*$/-A ufw-before-input -p icmp --icmp-type echo-request -j $HANDLE/"



$SED "$REPLACE_INPUT_DESTINATION_UNREACHABLE" $RULES_CONFIG
$SED "$REPLACE_INPUT_TIME_EXCEEDED" $RULES_CONFIG
$SED "$REPLACE_INPUT_PARAMETER_PROBLEM" $RULES_CONFIG
$SED "$REPLACE_INPUT_ECHO_REQUEST" $RULES_CONFIG

$SED "$REPLACE_FORWARD_DESTINATION_UNREACHABLE" $RULES_CONFIG
$SED "$REPLACE_FORWARD_TIME_EXCEEDED" $RULES_CONFIG
$SED "$REPLACE_FORWARD_PARAMETER_PROBLEM" $RULES_CONFIG
$SED "$REPLACE_FORWARD_ECHO_REQUEST" $RULES_CONFIG

