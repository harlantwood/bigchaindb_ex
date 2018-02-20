/*
 * Generated by asn1c-0.9.29 (http://lionet.info/asn1c)
 * From ASN.1 module "Fulfillments"
 * 	found in "Fulfillments.asn"
 * 	`asn1c -fcompound-names`
 */

#ifndef	_Fulfillment_H_
#define	_Fulfillment_H_


#include <asn_application.h>

/* Including external dependencies */
#include "PreimageFulfillment.h"
#include "RsaSha256Fulfillment.h"
#include "Ed25519Sha512Fulfillment.h"
#include <constr_CHOICE.h>

#ifdef __cplusplus
extern "C" {
#endif

/* Dependencies */
typedef enum Fulfillment_PR {
	Fulfillment_PR_NOTHING,	/* No components present */
	Fulfillment_PR_preimageSha256,
	Fulfillment_PR_prefixSha256,
	Fulfillment_PR_thresholdSha256,
	Fulfillment_PR_rsaSha256,
	Fulfillment_PR_ed25519Sha256
} Fulfillment_PR;

/* Forward declarations */
struct PrefixFulfillment;
struct ThresholdFulfillment;

/* Fulfillment */
typedef struct Fulfillment {
	Fulfillment_PR present;
	union Fulfillment_u {
		PreimageFulfillment_t	 preimageSha256;
		struct PrefixFulfillment	*prefixSha256;
		struct ThresholdFulfillment	*thresholdSha256;
		RsaSha256Fulfillment_t	 rsaSha256;
		Ed25519Sha512Fulfillment_t	 ed25519Sha256;
	} choice;
	
	/* Context for parsing across buffer boundaries */
	asn_struct_ctx_t _asn_ctx;
} Fulfillment_t;

/* Implementation */
extern asn_TYPE_descriptor_t asn_DEF_Fulfillment;
extern asn_CHOICE_specifics_t asn_SPC_Fulfillment_specs_1;
extern asn_TYPE_member_t asn_MBR_Fulfillment_1[5];
extern asn_per_constraints_t asn_PER_type_Fulfillment_constr_1;

#ifdef __cplusplus
}
#endif

/* Referred external types */
#include "PrefixFulfillment.h"
#include "ThresholdFulfillment.h"

#endif	/* _Fulfillment_H_ */
#include <asn_internal.h>
