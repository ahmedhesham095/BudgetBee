/* This file was generated by upbc (the upb compiler) from the input
 * file:
 *
 *     envoy/config/listener/v3/udp_listener_config.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated. */

#include <stddef.h>
#include "upb/msg_internal.h"
#include "envoy/config/listener/v3/udp_listener_config.upb.h"
#include "envoy/config/core/v3/udp_socket_config.upb.h"
#include "envoy/config/listener/v3/quic_config.upb.h"
#include "udpa/annotations/status.upb.h"
#include "udpa/annotations/versioning.upb.h"

#include "upb/port_def.inc"

static const upb_msglayout_sub envoy_config_listener_v3_UdpListenerConfig_submsgs[2] = {
  {.submsg = &envoy_config_core_v3_UdpSocketConfig_msginit},
  {.submsg = &envoy_config_listener_v3_QuicProtocolOptions_msginit},
};

static const upb_msglayout_field envoy_config_listener_v3_UdpListenerConfig__fields[2] = {
  {5, UPB_SIZE(4, 8), 1, 0, 11, _UPB_MODE_SCALAR | (_UPB_REP_PTR << _UPB_REP_SHIFT)},
  {7, UPB_SIZE(8, 16), 2, 1, 11, _UPB_MODE_SCALAR | (_UPB_REP_PTR << _UPB_REP_SHIFT)},
};

const upb_msglayout envoy_config_listener_v3_UdpListenerConfig_msginit = {
  &envoy_config_listener_v3_UdpListenerConfig_submsgs[0],
  &envoy_config_listener_v3_UdpListenerConfig__fields[0],
  UPB_SIZE(16, 24), 2, _UPB_MSGEXT_NONE, 0, 255,
};

const upb_msglayout envoy_config_listener_v3_ActiveRawUdpListenerConfig_msginit = {
  NULL,
  NULL,
  UPB_SIZE(0, 0), 0, _UPB_MSGEXT_NONE, 0, 255,
};

static const upb_msglayout *messages_layout[2] = {
  &envoy_config_listener_v3_UdpListenerConfig_msginit,
  &envoy_config_listener_v3_ActiveRawUdpListenerConfig_msginit,
};

const upb_msglayout_file envoy_config_listener_v3_udp_listener_config_proto_upb_file_layout = {
  messages_layout,
  NULL,
  2,
  0,
};

#include "upb/port_undef.inc"

