	.text
	.amdgcn_target "amdgcn-amd-amdhsa--gfx942"
	.protected	_Z19pointerChaseLatencyiPf ; -- Begin function _Z19pointerChaseLatencyiPf
	.globl	_Z19pointerChaseLatencyiPf
	.p2align	8
	.type	_Z19pointerChaseLatencyiPf,@function
_Z19pointerChaseLatencyiPf:             ; @_Z19pointerChaseLatencyiPf
; %bb.0:
	s_load_dword s3, s[0:1], 0x1c
	s_waitcnt lgkmcnt(0)
	s_and_b32 s3, s3, 0xffff
	s_mul_i32 s2, s2, s3
	s_sub_i32 s2, 0, s2
	s_mov_b32 s3, 0
	v_cmp_eq_u32_e32 vcc, s2, v0
	s_and_saveexec_b64 s[4:5], vcc
	s_cbranch_execz .LBB0_8
; %bb.1:
	s_load_dword s4, s[0:1], 0x0
	s_mov_b32 s2, 0xf4240
.LBB0_2:                                ; =>This Inner Loop Header: Depth=1
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s5, s4, 31
	s_lshl_b64 s[6:7], s[4:5], 2
	s_getpc_b64 s[4:5]
	s_add_u32 s4, s4, constData@rel32@lo+4
	s_addc_u32 s5, s5, constData@rel32@hi+12
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s6, s6, s4
	s_addc_u32 s7, s7, s5
	s_load_dword s6, s[6:7], 0x0
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s7, s6, 31
	s_lshl_b64 s[6:7], s[6:7], 2
	s_add_u32 s4, s6, s4
	s_addc_u32 s5, s7, s5
	s_load_dword s4, s[4:5], 0x0
	s_add_u32 s2, s2, 0xffffffec
	s_addc_u32 s3, s3, -1
	s_cmp_lg_u64 s[2:3], 0
	s_cbranch_scc1 .LBB0_2
; %bb.3:
	s_mov_b64 s[2:3], 0
	v_mov_b32_e32 v0, 0
	s_mov_b64 s[6:7], 0x989680
	s_getpc_b64 s[12:13]
	s_add_u32 s12, s12, constData@rel32@lo+4
	s_addc_u32 s13, s13, constData@rel32@hi+12
.LBB0_4:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_5 Depth 2
	s_memtime s[8:9]
	s_mov_b32 s10, 10
.LBB0_5:                                ;   Parent Loop BB0_4 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
	s_waitcnt lgkmcnt(0)
	s_ashr_i32 s5, s4, 31
	s_lshl_b64 s[4:5], s[4:5], 2
	s_add_u32 s4, s4, s12
	s_addc_u32 s5, s5, s13
	s_load_dword s4, s[4:5], 0x0
	s_add_i32 s10, s10, -1
	s_cmp_eq_u32 s10, 0
	s_cbranch_scc0 .LBB0_5
; %bb.6:                                ;   in Loop: Header=BB0_4 Depth=1
	s_memtime s[10:11]
	s_waitcnt lgkmcnt(0)
	s_sub_u32 s8, s10, s8
	s_subb_u32 s9, s11, s9
	s_flbit_i32_b32 s5, s9
	s_min_u32 s5, s5, 32
	s_lshl_b64 s[8:9], s[8:9], s5
	s_min_u32 s8, s8, 1
	s_sub_i32 s5, 32, s5
	s_or_b32 s8, s9, s8
	s_cmp_eq_u32 s4, -1
	v_cvt_f32_u32_e32 v1, s8
	s_cselect_b64 s[8:9], -1, 0
	s_add_u32 s2, s2, 1
	s_addc_u32 s3, s3, 0
	s_cmp_eq_u64 s[2:3], s[6:7]
	s_cselect_b64 s[10:11], -1, 0
	v_ldexp_f32 v1, v1, s5
	s_or_b64 s[8:9], s[8:9], s[10:11]
	v_add_f32_e32 v0, v0, v1
	s_and_b64 vcc, exec, s[8:9]
	s_cbranch_vccz .LBB0_4
; %bb.7:
	s_mov_b32 s4, 0x4cbebc20
	v_div_scale_f32 v1, s[2:3], s4, s4, v0
	v_rcp_f32_e32 v2, v1
	s_load_dwordx2 s[0:1], s[0:1], 0x8
	v_mov_b32_e32 v3, 0
	v_fma_f32 v4, -v1, v2, 1.0
	v_fmac_f32_e32 v2, v4, v2
	v_div_scale_f32 v4, vcc, v0, s4, v0
	v_mul_f32_e32 v5, v4, v2
	v_fma_f32 v6, -v1, v5, v4
	v_fmac_f32_e32 v5, v6, v2
	v_fma_f32 v1, -v1, v5, v4
	v_div_fmas_f32 v1, v1, v2, v5
	v_div_fixup_f32 v0, v1, s4, v0
	s_waitcnt lgkmcnt(0)
	global_store_dword v3, v0, s[0:1]
.LBB0_8:
	s_endpgm
	.section	.rodata,#alloc
	.p2align	6, 0x0
	.amdhsa_kernel _Z19pointerChaseLatencyiPf
		.amdhsa_group_segment_fixed_size 0
		.amdhsa_private_segment_fixed_size 0
		.amdhsa_kernarg_size 272
		.amdhsa_user_sgpr_count 2
		.amdhsa_user_sgpr_dispatch_ptr 0
		.amdhsa_user_sgpr_queue_ptr 0
		.amdhsa_user_sgpr_kernarg_segment_ptr 1
		.amdhsa_user_sgpr_dispatch_id 0
		.amdhsa_user_sgpr_kernarg_preload_length  0
		.amdhsa_user_sgpr_kernarg_preload_offset  0
		.amdhsa_user_sgpr_private_segment_size 0
		.amdhsa_uses_dynamic_stack 0
		.amdhsa_enable_private_segment 0
		.amdhsa_system_sgpr_workgroup_id_x 1
		.amdhsa_system_sgpr_workgroup_id_y 0
		.amdhsa_system_sgpr_workgroup_id_z 0
		.amdhsa_system_sgpr_workgroup_info 0
		.amdhsa_system_vgpr_workitem_id 0
		.amdhsa_next_free_vgpr 7
		.amdhsa_next_free_sgpr 14
		.amdhsa_accum_offset 8
		.amdhsa_reserve_xnack_mask 1
		.amdhsa_float_round_mode_32 0
		.amdhsa_float_round_mode_16_64 0
		.amdhsa_float_denorm_mode_32 3
		.amdhsa_float_denorm_mode_16_64 3
		.amdhsa_dx10_clamp 1
		.amdhsa_ieee_mode 1
		.amdhsa_fp16_overflow 0
		.amdhsa_tg_split 0
		.amdhsa_exception_fp_ieee_invalid_op 0
		.amdhsa_exception_fp_denorm_src 0
		.amdhsa_exception_fp_ieee_div_zero 0
		.amdhsa_exception_fp_ieee_overflow 0
		.amdhsa_exception_fp_ieee_underflow 0
		.amdhsa_exception_fp_ieee_inexact 0
		.amdhsa_exception_int_div_zero 0
	.end_amdhsa_kernel
	.text
.Lfunc_end0:
	.size	_Z19pointerChaseLatencyiPf, .Lfunc_end0-_Z19pointerChaseLatencyiPf
                                        ; -- End function
	.section	.AMDGPU.csdata
; Kernel info:
; codeLenInByte = 984
; NumSgprs: 20
; NumVgprs: 7
; NumAgprs: 0
; TotalNumVgprs: 7
; ScratchSize: 0
; MemoryBound: 0
; FloatMode: 240
; IeeeMode: 1
; LDSByteSize: 0 bytes/workgroup (compile time only)
; SGPRBlocks: 2
; VGPRBlocks: 0
; NumSGPRsForWavesPerEU: 20
; NumVGPRsForWavesPerEU: 7
; AccumOffset: 8
; Occupancy: 8
; WaveLimiterHint : 1
; COMPUTE_PGM_RSRC2:SCRATCH_EN: 0
; COMPUTE_PGM_RSRC2:USER_SGPR: 2
; COMPUTE_PGM_RSRC2:TRAP_HANDLER: 0
; COMPUTE_PGM_RSRC2:TGID_X_EN: 1
; COMPUTE_PGM_RSRC2:TGID_Y_EN: 0
; COMPUTE_PGM_RSRC2:TGID_Z_EN: 0
; COMPUTE_PGM_RSRC2:TIDIG_COMP_CNT: 0
; COMPUTE_PGM_RSRC3_GFX90A:ACCUM_OFFSET: 1
; COMPUTE_PGM_RSRC3_GFX90A:TG_SPLIT: 0
	.text
	.p2alignl 6, 3212836864
	.fill 256, 4, 3212836864
	.protected	constData               ; @constData
	.type	constData,@object
	.section	.bss,#alloc,#write
	.globl	constData
	.p2align	4, 0x0
constData:
	.zero	2097152
	.size	constData, 2097152

	.ident	"AMD clang version 17.0.0 (https://github.com/RadeonOpenCompute/llvm-project roc-6.1.0 24103 7db7f5e49612030319346f900c08f474b1f9023a)"
	.section	".note.GNU-stack"
	.addrsig
	.addrsig_sym constData
	.amdgpu_metadata
---
amdhsa.kernels:
  - .agpr_count:     0
    .args:
      - .offset:         0
        .size:           4
        .value_kind:     by_value
      - .address_space:  global
        .offset:         8
        .size:           8
        .value_kind:     global_buffer
      - .offset:         16
        .size:           4
        .value_kind:     hidden_block_count_x
      - .offset:         20
        .size:           4
        .value_kind:     hidden_block_count_y
      - .offset:         24
        .size:           4
        .value_kind:     hidden_block_count_z
      - .offset:         28
        .size:           2
        .value_kind:     hidden_group_size_x
      - .offset:         30
        .size:           2
        .value_kind:     hidden_group_size_y
      - .offset:         32
        .size:           2
        .value_kind:     hidden_group_size_z
      - .offset:         34
        .size:           2
        .value_kind:     hidden_remainder_x
      - .offset:         36
        .size:           2
        .value_kind:     hidden_remainder_y
      - .offset:         38
        .size:           2
        .value_kind:     hidden_remainder_z
      - .offset:         56
        .size:           8
        .value_kind:     hidden_global_offset_x
      - .offset:         64
        .size:           8
        .value_kind:     hidden_global_offset_y
      - .offset:         72
        .size:           8
        .value_kind:     hidden_global_offset_z
      - .offset:         80
        .size:           2
        .value_kind:     hidden_grid_dims
    .group_segment_fixed_size: 0
    .kernarg_segment_align: 8
    .kernarg_segment_size: 272
    .language:       OpenCL C
    .language_version:
      - 2
      - 0
    .max_flat_workgroup_size: 1024
    .name:           _Z19pointerChaseLatencyiPf
    .private_segment_fixed_size: 0
    .sgpr_count:     20
    .sgpr_spill_count: 0
    .symbol:         _Z19pointerChaseLatencyiPf.kd
    .uniform_work_group_size: 1
    .uses_dynamic_stack: false
    .vgpr_count:     7
    .vgpr_spill_count: 0
    .wavefront_size: 64
amdhsa.target:   amdgcn-amd-amdhsa--gfx942
amdhsa.version:
  - 1
  - 2
...

	.end_amdgpu_metadata
