/* This file was generated by upb_generator from the input file:
 *
 *     envoy/config/endpoint/v3/endpoint_components.proto
 *
 * Do not edit -- your changes will be discarded when the file is
 * regenerated.
 * NO CHECKED-IN PROTOBUF GENCODE */

#include "upb/reflection/def.h"
#include "envoy/config/endpoint/v3/endpoint_components.upbdefs.h"
#include "envoy/config/endpoint/v3/endpoint_components.upb_minitable.h"

extern _upb_DefPool_Init envoy_config_core_v3_address_proto_upbdefinit;
extern _upb_DefPool_Init envoy_config_core_v3_base_proto_upbdefinit;
extern _upb_DefPool_Init envoy_config_core_v3_config_source_proto_upbdefinit;
extern _upb_DefPool_Init envoy_config_core_v3_health_check_proto_upbdefinit;
extern _upb_DefPool_Init google_protobuf_wrappers_proto_upbdefinit;
extern _upb_DefPool_Init udpa_annotations_status_proto_upbdefinit;
extern _upb_DefPool_Init udpa_annotations_versioning_proto_upbdefinit;
extern _upb_DefPool_Init validate_validate_proto_upbdefinit;
static const char descriptor[2559] = {'\n', '2', 'e', 'n', 'v', 'o', 'y', '/', 'c', 'o', 'n', 'f', 'i', 'g', '/', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '/', 'v', 
'3', '/', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '_', 'c', 'o', 'm', 'p', 'o', 'n', 'e', 'n', 't', 's', '.', 'p', 'r', 'o', 
't', 'o', '\022', '\030', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', 
'.', 'v', '3', '\032', '\"', 'e', 'n', 'v', 'o', 'y', '/', 'c', 'o', 'n', 'f', 'i', 'g', '/', 'c', 'o', 'r', 'e', '/', 'v', '3', 
'/', 'a', 'd', 'd', 'r', 'e', 's', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '\037', 'e', 'n', 'v', 'o', 'y', '/', 'c', 'o', 'n', 
'f', 'i', 'g', '/', 'c', 'o', 'r', 'e', '/', 'v', '3', '/', 'b', 'a', 's', 'e', '.', 'p', 'r', 'o', 't', 'o', '\032', '(', 'e', 
'n', 'v', 'o', 'y', '/', 'c', 'o', 'n', 'f', 'i', 'g', '/', 'c', 'o', 'r', 'e', '/', 'v', '3', '/', 'c', 'o', 'n', 'f', 'i', 
'g', '_', 's', 'o', 'u', 'r', 'c', 'e', '.', 'p', 'r', 'o', 't', 'o', '\032', '\'', 'e', 'n', 'v', 'o', 'y', '/', 'c', 'o', 'n', 
'f', 'i', 'g', '/', 'c', 'o', 'r', 'e', '/', 'v', '3', '/', 'h', 'e', 'a', 'l', 't', 'h', '_', 'c', 'h', 'e', 'c', 'k', '.', 
'p', 'r', 'o', 't', 'o', '\032', '\036', 'g', 'o', 'o', 'g', 'l', 'e', '/', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '/', 'w', 'r', 
'a', 'p', 'p', 'e', 'r', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '\035', 'u', 'd', 'p', 'a', '/', 'a', 'n', 'n', 'o', 't', 'a', 
't', 'i', 'o', 'n', 's', '/', 's', 't', 'a', 't', 'u', 's', '.', 'p', 'r', 'o', 't', 'o', '\032', '!', 'u', 'd', 'p', 'a', '/', 
'a', 'n', 'n', 'o', 't', 'a', 't', 'i', 'o', 'n', 's', '/', 'v', 'e', 'r', 's', 'i', 'o', 'n', 'i', 'n', 'g', '.', 'p', 'r', 
'o', 't', 'o', '\032', '\027', 'v', 'a', 'l', 'i', 'd', 'a', 't', 'e', '/', 'v', 'a', 'l', 'i', 'd', 'a', 't', 'e', '.', 'p', 'r', 
'o', 't', 'o', '\"', '\260', '\005', '\n', '\010', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', '\022', '7', '\n', '\007', 'a', 'd', 'd', 'r', 'e', 
's', 's', '\030', '\001', ' ', '\001', '(', '\013', '2', '\035', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'c', 
'o', 'r', 'e', '.', 'v', '3', '.', 'A', 'd', 'd', 'r', 'e', 's', 's', 'R', '\007', 'a', 'd', 'd', 'r', 'e', 's', 's', '\022', 'd', 
'\n', '\023', 'h', 'e', 'a', 'l', 't', 'h', '_', 'c', 'h', 'e', 'c', 'k', '_', 'c', 'o', 'n', 'f', 'i', 'g', '\030', '\002', ' ', '\001', 
'(', '\013', '2', '4', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 
't', '.', 'v', '3', '.', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'H', 'e', 'a', 'l', 't', 'h', 'C', 'h', 'e', 'c', 'k', 
'C', 'o', 'n', 'f', 'i', 'g', 'R', '\021', 'h', 'e', 'a', 'l', 't', 'h', 'C', 'h', 'e', 'c', 'k', 'C', 'o', 'n', 'f', 'i', 'g', 
'\022', '\032', '\n', '\010', 'h', 'o', 's', 't', 'n', 'a', 'm', 'e', '\030', '\003', ' ', '\001', '(', '\t', 'R', '\010', 'h', 'o', 's', 't', 'n', 
'a', 'm', 'e', '\022', 'g', '\n', '\024', 'a', 'd', 'd', 'i', 't', 'i', 'o', 'n', 'a', 'l', '_', 'a', 'd', 'd', 'r', 'e', 's', 's', 
'e', 's', '\030', '\004', ' ', '\003', '(', '\013', '2', '4', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'e', 
'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'v', '3', '.', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'A', 'd', 'd', 'i', 't', 
'i', 'o', 'n', 'a', 'l', 'A', 'd', 'd', 'r', 'e', 's', 's', 'R', '\023', 'a', 'd', 'd', 'i', 't', 'i', 'o', 'n', 'a', 'l', 'A', 
'd', 'd', 'r', 'e', 's', 's', 'e', 's', '\032', '\212', '\002', '\n', '\021', 'H', 'e', 'a', 'l', 't', 'h', 'C', 'h', 'e', 'c', 'k', 'C', 
'o', 'n', 'f', 'i', 'g', '\022', '(', '\n', '\n', 'p', 'o', 'r', 't', '_', 'v', 'a', 'l', 'u', 'e', '\030', '\001', ' ', '\001', '(', '\r', 
'B', '\t', '\372', 'B', '\006', '*', '\004', '\030', '\377', '\377', '\003', 'R', '\t', 'p', 'o', 'r', 't', 'V', 'a', 'l', 'u', 'e', '\022', '\032', '\n', 
'\010', 'h', 'o', 's', 't', 'n', 'a', 'm', 'e', '\030', '\002', ' ', '\001', '(', '\t', 'R', '\010', 'h', 'o', 's', 't', 'n', 'a', 'm', 'e', 
'\022', '7', '\n', '\007', 'a', 'd', 'd', 'r', 'e', 's', 's', '\030', '\003', ' ', '\001', '(', '\013', '2', '\035', '.', 'e', 'n', 'v', 'o', 'y', 
'.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'c', 'o', 'r', 'e', '.', 'v', '3', '.', 'A', 'd', 'd', 'r', 'e', 's', 's', 'R', '\007', 
'a', 'd', 'd', 'r', 'e', 's', 's', '\022', '=', '\n', '\033', 'd', 'i', 's', 'a', 'b', 'l', 'e', '_', 'a', 'c', 't', 'i', 'v', 'e', 
'_', 'h', 'e', 'a', 'l', 't', 'h', '_', 'c', 'h', 'e', 'c', 'k', '\030', '\004', ' ', '\001', '(', '\010', 'R', '\030', 'd', 'i', 's', 'a', 
'b', 'l', 'e', 'A', 'c', 't', 'i', 'v', 'e', 'H', 'e', 'a', 'l', 't', 'h', 'C', 'h', 'e', 'c', 'k', ':', '7', '\232', '\305', '\210', 
'\036', '2', '\n', '0', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', 
'.', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'H', 'e', 'a', 'l', 't', 'h', 'C', 'h', 'e', 'c', 'k', 'C', 'o', 'n', 'f', 
'i', 'g', '\032', 'L', '\n', '\021', 'A', 'd', 'd', 'i', 't', 'i', 'o', 'n', 'a', 'l', 'A', 'd', 'd', 'r', 'e', 's', 's', '\022', '7', 
'\n', '\007', 'a', 'd', 'd', 'r', 'e', 's', 's', '\030', '\001', ' ', '\001', '(', '\013', '2', '\035', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 
'o', 'n', 'f', 'i', 'g', '.', 'c', 'o', 'r', 'e', '.', 'v', '3', '.', 'A', 'd', 'd', 'r', 'e', 's', 's', 'R', '\007', 'a', 'd', 
'd', 'r', 'e', 's', 's', ':', '%', '\232', '\305', '\210', '\036', ' ', '\n', '\036', 'e', 'n', 'v', 'o', 'y', '.', 'a', 'p', 'i', '.', 'v', 
'2', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', '\"', '\221', '\003', '\n', '\n', 'L', 
'b', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', '\022', '@', '\n', '\010', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '\030', '\001', ' ', '\001', 
'(', '\013', '2', '\"', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 
't', '.', 'v', '3', '.', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', 'H', '\000', 'R', '\010', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', 
'\022', '%', '\n', '\r', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '_', 'n', 'a', 'm', 'e', '\030', '\005', ' ', '\001', '(', '\t', 'H', '\000', 
'R', '\014', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', 'N', 'a', 'm', 'e', '\022', 'G', '\n', '\r', 'h', 'e', 'a', 'l', 't', 'h', '_', 
's', 't', 'a', 't', 'u', 's', '\030', '\002', ' ', '\001', '(', '\016', '2', '\"', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 
'i', 'g', '.', 'c', 'o', 'r', 'e', '.', 'v', '3', '.', 'H', 'e', 'a', 'l', 't', 'h', 'S', 't', 'a', 't', 'u', 's', 'R', '\014', 
'h', 'e', 'a', 'l', 't', 'h', 'S', 't', 'a', 't', 'u', 's', '\022', ':', '\n', '\010', 'm', 'e', 't', 'a', 'd', 'a', 't', 'a', '\030', 
'\003', ' ', '\001', '(', '\013', '2', '\036', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'c', 'o', 'r', 'e', 
'.', 'v', '3', '.', 'M', 'e', 't', 'a', 'd', 'a', 't', 'a', 'R', '\010', 'm', 'e', 't', 'a', 'd', 'a', 't', 'a', '\022', 'Y', '\n', 
'\025', 'l', 'o', 'a', 'd', '_', 'b', 'a', 'l', 'a', 'n', 'c', 'i', 'n', 'g', '_', 'w', 'e', 'i', 'g', 'h', 't', '\030', '\004', ' ', 
'\001', '(', '\013', '2', '\034', '.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '.', 'U', 'I', 'n', 
't', '3', '2', 'V', 'a', 'l', 'u', 'e', 'B', '\007', '\372', 'B', '\004', '*', '\002', '(', '\001', 'R', '\023', 'l', 'o', 'a', 'd', 'B', 'a', 
'l', 'a', 'n', 'c', 'i', 'n', 'g', 'W', 'e', 'i', 'g', 'h', 't', ':', '\'', '\232', '\305', '\210', '\036', '\"', '\n', ' ', 'e', 'n', 'v', 
'o', 'y', '.', 'a', 'p', 'i', '.', 'v', '2', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'L', 'b', 'E', 'n', 'd', 'p', 
'o', 'i', 'n', 't', 'B', '\021', '\n', '\017', 'h', 'o', 's', 't', '_', 'i', 'd', 'e', 'n', 't', 'i', 'f', 'i', 'e', 'r', '\"', '\222', 
'\001', '\n', '\031', 'L', 'e', 'd', 's', 'C', 'l', 'u', 's', 't', 'e', 'r', 'L', 'o', 'c', 'a', 'l', 'i', 't', 'y', 'C', 'o', 'n', 
'f', 'i', 'g', '\022', 'C', '\n', '\013', 'l', 'e', 'd', 's', '_', 'c', 'o', 'n', 'f', 'i', 'g', '\030', '\001', ' ', '\001', '(', '\013', '2', 
'\"', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'c', 'o', 'r', 'e', '.', 'v', '3', '.', 'C', 'o', 
'n', 'f', 'i', 'g', 'S', 'o', 'u', 'r', 'c', 'e', 'R', '\n', 'l', 'e', 'd', 's', 'C', 'o', 'n', 'f', 'i', 'g', '\022', '0', '\n', 
'\024', 'l', 'e', 'd', 's', '_', 'c', 'o', 'l', 'l', 'e', 'c', 't', 'i', 'o', 'n', '_', 'n', 'a', 'm', 'e', '\030', '\002', ' ', '\001', 
'(', '\t', 'R', '\022', 'l', 'e', 'd', 's', 'C', 'o', 'l', 'l', 'e', 'c', 't', 'i', 'o', 'n', 'N', 'a', 'm', 'e', '\"', '\235', '\006', 
'\n', '\023', 'L', 'o', 'c', 'a', 'l', 'i', 't', 'y', 'L', 'b', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', 's', '\022', ':', '\n', '\010', 
'l', 'o', 'c', 'a', 'l', 'i', 't', 'y', '\030', '\001', ' ', '\001', '(', '\013', '2', '\036', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 
'n', 'f', 'i', 'g', '.', 'c', 'o', 'r', 'e', '.', 'v', '3', '.', 'L', 'o', 'c', 'a', 'l', 'i', 't', 'y', 'R', '\010', 'l', 'o', 
'c', 'a', 'l', 'i', 't', 'y', '\022', ':', '\n', '\010', 'm', 'e', 't', 'a', 'd', 'a', 't', 'a', '\030', '\t', ' ', '\001', '(', '\013', '2', 
'\036', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'c', 'o', 'r', 'e', '.', 'v', '3', '.', 'M', 'e', 
't', 'a', 'd', 'a', 't', 'a', 'R', '\010', 'm', 'e', 't', 'a', 'd', 'a', 't', 'a', '\022', 'G', '\n', '\014', 'l', 'b', '_', 'e', 'n', 
'd', 'p', 'o', 'i', 'n', 't', 's', '\030', '\002', ' ', '\003', '(', '\013', '2', '$', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 
'f', 'i', 'g', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'v', '3', '.', 'L', 'b', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 
't', 'R', '\013', 'l', 'b', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', 's', '\022', 'v', '\n', '\027', 'l', 'o', 'a', 'd', '_', 'b', 'a', 
'l', 'a', 'n', 'c', 'e', 'r', '_', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', 's', '\030', '\007', ' ', '\001', '(', '\013', '2', '<', '.', 
'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'v', '3', '.', 
'L', 'o', 'c', 'a', 'l', 'i', 't', 'y', 'L', 'b', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', 's', '.', 'L', 'b', 'E', 'n', 'd', 
'p', 'o', 'i', 'n', 't', 'L', 'i', 's', 't', 'H', '\000', 'R', '\025', 'l', 'o', 'a', 'd', 'B', 'a', 'l', 'a', 'n', 'c', 'e', 'r', 
'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', 's', '\022', 'v', '\n', '\034', 'l', 'e', 'd', 's', '_', 'c', 'l', 'u', 's', 't', 'e', 'r', 
'_', 'l', 'o', 'c', 'a', 'l', 'i', 't', 'y', '_', 'c', 'o', 'n', 'f', 'i', 'g', '\030', '\010', ' ', '\001', '(', '\013', '2', '3', '.', 
'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'v', '3', '.', 
'L', 'e', 'd', 's', 'C', 'l', 'u', 's', 't', 'e', 'r', 'L', 'o', 'c', 'a', 'l', 'i', 't', 'y', 'C', 'o', 'n', 'f', 'i', 'g', 
'H', '\000', 'R', '\031', 'l', 'e', 'd', 's', 'C', 'l', 'u', 's', 't', 'e', 'r', 'L', 'o', 'c', 'a', 'l', 'i', 't', 'y', 'C', 'o', 
'n', 'f', 'i', 'g', '\022', 'Y', '\n', '\025', 'l', 'o', 'a', 'd', '_', 'b', 'a', 'l', 'a', 'n', 'c', 'i', 'n', 'g', '_', 'w', 'e', 
'i', 'g', 'h', 't', '\030', '\003', ' ', '\001', '(', '\013', '2', '\034', '.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 
'b', 'u', 'f', '.', 'U', 'I', 'n', 't', '3', '2', 'V', 'a', 'l', 'u', 'e', 'B', '\007', '\372', 'B', '\004', '*', '\002', '(', '\001', 'R', 
'\023', 'l', 'o', 'a', 'd', 'B', 'a', 'l', 'a', 'n', 'c', 'i', 'n', 'g', 'W', 'e', 'i', 'g', 'h', 't', '\022', '$', '\n', '\010', 'p', 
'r', 'i', 'o', 'r', 'i', 't', 'y', '\030', '\005', ' ', '\001', '(', '\r', 'B', '\010', '\372', 'B', '\005', '*', '\003', '\030', '\200', '\001', 'R', '\010', 
'p', 'r', 'i', 'o', 'r', 'i', 't', 'y', '\022', ':', '\n', '\t', 'p', 'r', 'o', 'x', 'i', 'm', 'i', 't', 'y', '\030', '\006', ' ', '\001', 
'(', '\013', '2', '\034', '.', 'g', 'o', 'o', 'g', 'l', 'e', '.', 'p', 'r', 'o', 't', 'o', 'b', 'u', 'f', '.', 'U', 'I', 'n', 't', 
'3', '2', 'V', 'a', 'l', 'u', 'e', 'R', '\t', 'p', 'r', 'o', 'x', 'i', 'm', 'i', 't', 'y', '\032', 'Y', '\n', '\016', 'L', 'b', 'E', 
'n', 'd', 'p', 'o', 'i', 'n', 't', 'L', 'i', 's', 't', '\022', 'G', '\n', '\014', 'l', 'b', '_', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 
't', 's', '\030', '\001', ' ', '\003', '(', '\013', '2', '$', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 'f', 'i', 'g', '.', 'e', 
'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'v', '3', '.', 'L', 'b', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', 'R', '\013', 'l', 'b', 
'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', 's', ':', '0', '\232', '\305', '\210', '\036', '+', '\n', ')', 'e', 'n', 'v', 'o', 'y', '.', 'a', 
'p', 'i', '.', 'v', '2', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'L', 'o', 'c', 'a', 'l', 'i', 't', 'y', 'L', 'b', 
'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', 's', 'B', '\013', '\n', '\t', 'l', 'b', '_', 'c', 'o', 'n', 'f', 'i', 'g', 'B', '\227', '\001', 
'\n', '&', 'i', 'o', '.', 'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '.', 'e', 'n', 'v', 'o', 'y', '.', 'c', 'o', 'n', 
'f', 'i', 'g', '.', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', '.', 'v', '3', 'B', '\027', 'E', 'n', 'd', 'p', 'o', 'i', 'n', 't', 
'C', 'o', 'm', 'p', 'o', 'n', 'e', 'n', 't', 's', 'P', 'r', 'o', 't', 'o', 'P', '\001', 'Z', 'J', 'g', 'i', 't', 'h', 'u', 'b', 
'.', 'c', 'o', 'm', '/', 'e', 'n', 'v', 'o', 'y', 'p', 'r', 'o', 'x', 'y', '/', 'g', 'o', '-', 'c', 'o', 'n', 't', 'r', 'o', 
'l', '-', 'p', 'l', 'a', 'n', 'e', '/', 'e', 'n', 'v', 'o', 'y', '/', 'c', 'o', 'n', 'f', 'i', 'g', '/', 'e', 'n', 'd', 'p', 
'o', 'i', 'n', 't', '/', 'v', '3', ';', 'e', 'n', 'd', 'p', 'o', 'i', 'n', 't', 'v', '3', '\272', '\200', '\310', '\321', '\006', '\002', '\020', 
'\002', 'b', '\006', 'p', 'r', 'o', 't', 'o', '3', 
};

static _upb_DefPool_Init *deps[9] = {
  &envoy_config_core_v3_address_proto_upbdefinit,
  &envoy_config_core_v3_base_proto_upbdefinit,
  &envoy_config_core_v3_config_source_proto_upbdefinit,
  &envoy_config_core_v3_health_check_proto_upbdefinit,
  &google_protobuf_wrappers_proto_upbdefinit,
  &udpa_annotations_status_proto_upbdefinit,
  &udpa_annotations_versioning_proto_upbdefinit,
  &validate_validate_proto_upbdefinit,
  NULL
};

_upb_DefPool_Init envoy_config_endpoint_v3_endpoint_components_proto_upbdefinit = {
  deps,
  &envoy_config_endpoint_v3_endpoint_components_proto_upb_file_layout,
  "envoy/config/endpoint/v3/endpoint_components.proto",
  UPB_STRINGVIEW_INIT(descriptor, 2559)
};
