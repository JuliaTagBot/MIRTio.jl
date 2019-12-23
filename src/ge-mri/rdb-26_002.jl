#=
rdb-26_002.jl
based on
https://gitlab.com/fMRI/toppe/blob/master/+toppe/+utils/read_rdb_hdr.m

Matlab version is:
Copyright (c) 2012 by General Electric Company. All rights reserved.

2019-05-22 Julia version by Jeff Fessler
=#


"""
`s = read_rdb_hdr_26_002(fid)`

Read GE raw (RDB) header for MRI scan file

in
- `fid::IOStream` from open(file, "r")

out
- `s::NamedTuple` with header values, accessed by s.key
"""
function read_rdb_hdr_26_002(fid::IOStream)
	seek(fid, 0)

	read1 = (T::DataType) -> read(fid, T)

	fread = (n::Integer, T::DataType) ->
		begin
			data = Array{T}(undef, n)
			read!(fid, data)
			return data
		end

	freadc = (n::Integer) -> rstrip(String(fread(n, UInt8)))

	return ( # NamedTuple
		rdbm_rev = read1(Float32),
		off_data = read1(Int32),
		off_per_pass = read1(Int32),
		off_unlock_raw = read1(Int32),
		off_data_acq_tab = read1(Int32),
		off_nex_tab = read1(Int32),
		off_nex_abort_tab = read1(Int32),
		off_tool = read1(Int32),
		off_exam = read1(Int32),
		off_series = read1(Int32),
		off_image = read1(Int32),
		off_ps = read1(Int32),
		off_grad_data = read1(Int32),
		off_CTT_data = read1(Int32),
		off_spare1 = read1(Int32),
		off_spare2 = read1(Int32),
		off_spare3 = read1(Int32),
		off_spare4 = read1(Int32),
		off_spare5 = read1(Int32),
		off_spare6 = read1(Int32),
		run_int = read1(Int32),
		scan_seq = read1(Int16),
		run_char = freadc(6),
		scan_date = freadc(10),
		scan_time = freadc(8),
		logo = freadc(10),
		file_contents = read1(Int16),
		lock_mode = read1(Int16),
		dacq_ctrl = read1(Int16),
		recon_ctrl = read1(UInt16),
		exec_ctrl = read1(UInt16),
		scan_type = read1(Int16),
		data_collect_type = read1(Int16),
		data_format = read1(Int16),
		recon = read1(Int16),
		datacq = read1(Int16),
		npasses = read1(Int16),
		npomp = read1(Int16),
		nslices = read1(UInt16),
		nechoes = read1(Int16),
		navs = read1(Int16),
		nframes = read1(Int16),
		baseline_views = read1(Int16),
		hnover = read1(Int16),
		frame_size = read1(UInt16),
		point_size = read1(Int16),
		vquant = read1(Int16),
		cheart = read1(Int16),
		ctr = read1(Float32),
		ctrr = read1(Float32),
		initpass = read1(Int16),
		incrpass = read1(Int16),
		method_ctrl = read1(Int16),
		da_xres = read1(UInt16),
		da_yres = read1(Int16),
		rc_xres = read1(Int16),
		rc_yres = read1(Int16),
		im_size = read1(Int16),
		rc_zres = read1(Int32),
		fermi_radius = read1(Float32),
		fermi_width = read1(Float32),
		fermi_ecc = read1(Float32),
		clip_min = read1(Float32),
		clip_max = read1(Float32),
		default_offset = read1(Float32),
		xoff = read1(Float32),
		yoff = read1(Float32),
		nwin = read1(Float32),
		ntran = read1(Float32),
		scalei = read1(Float32),
		scaleq = read1(Float32),
		rotation = read1(Int16),
		transpose = read1(Int16),
		kissoff_views = read1(Int16),
		slblank = read1(Int16),
		gradcoil = read1(Int16),
		ddaover = read1(Int16),
		sarr = read1(Int16),
		fd_tr = read1(Int16),
		fd_te = read1(Int16),
		fd_ctrl = read1(Int16),
		algor_num = read1(Int16),
		fd_df_dec = read1(Int16),
		dab = fread(8, Int16),
		user0 = read1(Float32),
		user1 = read1(Float32),
		user2 = read1(Float32),
		user3 = read1(Float32),
		user4 = read1(Float32),
		user5 = read1(Float32),
		user6 = read1(Float32),
		user7 = read1(Float32),
		user8 = read1(Float32),
		user9 = read1(Float32),
		user10 = read1(Float32),
		user11 = read1(Float32),
		user12 = read1(Float32),
		user13 = read1(Float32),
		user14 = read1(Float32),
		user15 = read1(Float32),
		user16 = read1(Float32),
		user17 = read1(Float32),
		user18 = read1(Float32),
		user19 = read1(Float32),
		v_type = read1(Int32),
		v_coefxa = read1(Float32),
		v_coefxb = read1(Float32),
		v_coefxc = read1(Float32),
		v_coefxd = read1(Float32),
		v_coefya = read1(Float32),
		v_coefyb = read1(Float32),
		v_coefyc = read1(Float32),
		v_coefyd = read1(Float32),
		v_coefza = read1(Float32),
		v_coefzb = read1(Float32),
		v_coefzc = read1(Float32),
		v_coefzd = read1(Float32),
		vm_coef1 = read1(Float32),
		vm_coef2 = read1(Float32),
		vm_coef3 = read1(Float32),
		vm_coef4 = read1(Float32),
		v_venc = read1(Float32),
		spectral_width = read1(Float32),
		csi_dims = read1(Int16),
		xcsi = read1(Int16),
		ycsi = read1(Int16),
		zcsi = read1(Int16),
		roilenx = read1(Float32),
		roileny = read1(Float32),
		roilenz = read1(Float32),
		roilocx = read1(Float32),
		roilocy = read1(Float32),
		roilocz = read1(Float32),
		numdwell = read1(Float32),
		ps_command = read1(Int32),
		ps_mps_r1 = read1(Int32),
		ps_mps_r2 = read1(Int32),
		ps_mps_tg = read1(Int32),
		ps_mps_freq = read1(UInt32),
		ps_aps_r1 = read1(Int32),
		ps_aps_r2 = read1(Int32),
		ps_aps_tg = read1(Int32),
		ps_aps_freq = read1(UInt32),
		ps_scalei = read1(Float32),
		ps_scaleq = read1(Float32),
		ps_snr_warning = read1(Int32),
		ps_aps_or_mps = read1(Int32),
		ps_mps_bitmap = read1(Int32),
		ps_powerspec = freadc(256),
		ps_filler1 = read1(Int32),
		ps_filler2 = read1(Int32),
		halfecho = read1(Int16),
		im_size_y = read1(Int16),
		data_collect_type1 = read1(Int32),
		freq_scale = read1(Float32),
		phase_scale = read1(Float32),
		ovl = read1(Int16),
		pclin = read1(Int16),
		pclinnpts = read1(Int16),
		pclinorder = read1(Int16),
		pclinavg = read1(Int16),
		pccon = read1(Int16),
		pcconnpts = read1(Int16),
		pcconorder = read1(Int16),
		pcextcorr = read1(Int16),
		pcgraph = read1(Int16),
		pcileave = read1(Int16),
		hdbestky = read1(Int16),
		pcctrl = read1(Int16),
		pcthrespts = read1(Int16),
		pcdiscbeg = read1(Int16),
		pcdiscmid = read1(Int16),
		pcdiscend = read1(Int16),
		pcthrespct = read1(Int16),
		pcspacial = read1(Int16),
		pctemporal = read1(Int16),
		pcspare = read1(Int16),
		ileaves = read1(Int16),
		kydir = read1(Int16),
		alt = read1(Int16),
		reps = read1(Int16),
		ref = read1(Int16),
		pcconnorm = read1(Float32),
		pcconfitwt = read1(Float32),
		pclinnorm = read1(Float32),
		pclinfitwt = read1(Float32),
		pcbestky = read1(Float32),
		vrgf = read1(Int32),
		vrgfxres = read1(Int32),
		bp_corr = read1(Int32),
		recv_freq_s = read1(Float32),
		recv_freq_e = read1(Float32),
		hniter = read1(Int32),
		fast_rec = read1(Int32),
		refframes = read1(Int32),
		refframep = read1(Int32),
		scnframe = read1(Int32),
		pasframe = read1(Int32),
		user_usage_tag = read1(UInt32),
		user_fill_mapMSW = read1(UInt32),
		user_fill_mapLSW = read1(UInt32),
		user20 = read1(Float32),
		user21 = read1(Float32),
		user22 = read1(Float32),
		user23 = read1(Float32),
		user24 = read1(Float32),
		user25 = read1(Float32),
		user26 = read1(Float32),
		user27 = read1(Float32),
		user28 = read1(Float32),
		user29 = read1(Float32),
		user30 = read1(Float32),
		user31 = read1(Float32),
		user32 = read1(Float32),
		user33 = read1(Float32),
		user34 = read1(Float32),
		user35 = read1(Float32),
		user36 = read1(Float32),
		user37 = read1(Float32),
		user38 = read1(Float32),
		user39 = read1(Float32),
		user40 = read1(Float32),
		user41 = read1(Float32),
		user42 = read1(Float32),
		user43 = read1(Float32),
		user44 = read1(Float32),
		user45 = read1(Float32),
		user46 = read1(Float32),
		user47 = read1(Float32),
		user48 = read1(Float32),
		pcfitorig = read1(Int16),
		pcshotfirst = read1(Int16),
		pcshotlast = read1(Int16),
		pcmultegrp = read1(Int16),
		pclinfix = read1(Int16),
		pcconfix = read1(Int16),
		pclinslope = read1(Float32),
		pcconslope = read1(Float32),
		pccoil = read1(Int16),
		vvsmode = read1(Int16),
		vvsaimgs = read1(Int16),
		vvstr = read1(Int16),
		vvsgender = read1(Int16),
		zip_factor = read1(Int16),
		maxcoef1a = read1(Float32),
		maxcoef1b = read1(Float32),
		maxcoef1c = read1(Float32),
		maxcoef1d = read1(Float32),
		maxcoef2a = read1(Float32),
		maxcoef2b = read1(Float32),
		maxcoef2c = read1(Float32),
		maxcoef2d = read1(Float32),
		maxcoef3a = read1(Float32),
		maxcoef3b = read1(Float32),
		maxcoef3c = read1(Float32),
		maxcoef3d = read1(Float32),
		ut_ctrl = read1(Int32),
		dp_type = read1(Int16),
		arw = read1(Int16),
		vps = read1(Int16),
		mcReconEnable = read1(Int16),
		fov = read1(Float32),
		te = read1(Int32),
		te2 = read1(Int32),
		dfmrbw = read1(Float32),
		dfmctrl = read1(Int32),
		raw_nex = read1(Int32),
		navs_per_pass = read1(Int32),
		dfmxres = read1(Int32),
		dfmptsize = read1(Int32),
		navs_per_view = read1(Int32),
		dfmdebug = read1(Int32),
		dfmthreshold = read1(Float32),
		grid_control = read1(Int16),
		b0map = read1(Int16),
		grid_tediff = read1(Int16),
		grid_motion_comp = read1(Int16),
		grid_radius_a = read1(Float32),
		grid_radius_b = read1(Float32),
		grid_max_gradient = read1(Float32),
		grid_max_slew = read1(Float32),
		grid_scan_fov = read1(Float32),
		grid_a2d_time = read1(Float32),
		grid_density_factor = read1(Float32),
		grid_display_fov = read1(Float32),
		fatwater = read1(Int16),
		fiestamlf = read1(Int16),
		app = read1(Int16),
		rhncoilsel = read1(Int16),
		rhncoillimit = read1(Int16),
		app_option = read1(Int16),
		grad_mode = read1(Int16),
		pfile_passes = read1(Int16),
		asset = read1(Int32),
		asset_calthresh = read1(Int32),
		asset_R = read1(Float32),
		coilConfigUID = read1(UInt32),
		asset_phases = read1(Int32),
		scancent = read1(Float32),
		position = read1(Int32),
		entry = read1(Int32),
		lmhor = read1(Float32),
		last_slice_num = read1(Int32),
		asset_slice_R = read1(Float32),
		asset_slabwrap = read1(Float32),
		dwnav_coeff = read1(Float32),
		dwnav_cor = read1(Int16),
		dwnav_view = read1(Int16),
		dwnav_corecho = read1(Int16),
		dwnav_sview = read1(Int16),
		dwnav_eview = read1(Int16),
		dwnav_sshot = read1(Int16),
		dwnav_eshot = read1(Int16),
		a3dwin_type = read1(Int16),
		a3dwin_apod = read1(Float32),
		a3dwin_q = read1(Float32),
		ime_scic_enable = read1(Int16),
		clariview_type = read1(Int16),
		ime_scic_edge = read1(Float32),
		ime_scic_smooth = read1(Float32),
		ime_scic_focus = read1(Float32),
		clariview_edge = read1(Float32),
		clariview_smooth = read1(Float32),
		clariview_focus = read1(Float32),
		scic_reduction = read1(Float32),
		scic_gauss = read1(Float32),
		scic_threshold = read1(Float32),
		ectricks_no_regions = read1(Int32),
		ectricks_input_regions = read1(Int32),
		psc_reuse = read1(Int16),
		left_blank = read1(Int16),
		right_blank = read1(Int16),
		acquire_type = read1(Int16),
		retro_control = read1(Int16),
		etl = read1(Int16),
		pcref_start = read1(Int16),
		pcref_stop = read1(Int16),
		ref_skip = read1(Int16),
		extra_frames_top = read1(Int16),
		extra_frames_bot = read1(Int16),
		multiphase_type = read1(Int16),
		nphases = read1(Int16),
		pure = read1(Int16),
		pure_scale = read1(Float32),
		new_wnd_level_flag = read1(Int32),
		wnd_image_hist_area = read1(Int32),
		wnd_high_hist = read1(Float32),
		wnd_lower_hist = read1(Float32),
		pure_filter = read1(Int16),
		cfg_pure_filter = read1(Int16),
		cfg_pure_fit_order = read1(Int16),
		cfg_pure_kernelsize_z = read1(Int16),
		cfg_pure_kernelsize_xy = read1(Int16),
		cfg_pure_weight_radius = read1(Int16),
		cfg_pure_intensity_scale = read1(Int16),
		cfg_pure_noise_threshold = read1(Int16),
		wienera = read1(Float32),
		wienerb = read1(Float32),
		wienert2 = read1(Float32),
		wieneresp = read1(Float32),
		wiener = read1(Int16),
		flipfilter = read1(Int16),
		dbgrecon = read1(Int16),
		ech2skip = read1(Int16),
		tricks_type = read1(Int32),
		lcfiesta_phase = read1(Float32),
		lcfiesta = read1(Int16),
		herawflt = read1(Int16),
		herawflt_befnwin = read1(Int16),
		herawflt_befntran = read1(Int16),
		herawflt_befamp = read1(Float32),
		herawflt_hpfamp = read1(Float32),
		heover = read1(Int16),
		pure_correction_threshold = read1(Int16),
		swiftenable = read1(Int32),
		numslabs = read1(Int16),
		numCoilConfigs = read1(UInt16),
		ps_autoshim_status = read1(Int32),
		dynaplan_numphases = read1(Int32),
		medal_cfg = read1(Int16),
		medal_nstack = read1(Int16),
		medal_echo_order = read1(Int16),
		medal_kernel_up = read1(Int16),
		medal_kernel_down = read1(Int16),
		medal_kernel_smooth = read1(Int16),
		medal_start = read1(Int16),
		medal_end = read1(Int16),
		rcideal = read1(UInt32),
		rcdixproc = read1(UInt32),
		df = read1(Float32),
		bw = read1(Float32),
		feextra = read1(Int32),
		raw_pass_size = read1(UInt64),
		sspsave = read1(UInt64),
		udasave = read1(UInt64),
		vibrant = read1(Int16),
		asset_torso = read1(Int16),
		asset_alt_cal = read1(Int32),
		kacq_uid = read1(Int32),
		psc_ta = read1(Int32),
		disk_acq_ctrl = read1(Int32),
		asset_localTx = read1(Int32),
		a3dscale = read1(Float32),
		broad_band_select = read1(Int32),
		scanner_mode = read1(Int16),
		numbvals = read1(Int16),
		numdifdirs = read1(Int16),
		difnext2 = read1(Int16),
		difnextab = fread(100, Int16),
		channel_combine_method = read1(Int16),
		nexForUnacquiredEncodes = read1(Int16),
		a2dscale = read1(Float32),
		dd_mode = read1(Int16),
		dd_q_ta_offset = read1(Int16),
		dd_q_phase_delay = read1(Float32),
		dacq_ctrl_chksum = read1(UInt32),
		patient_checksum = read1(UInt32),
		rcidealctrl = read1(UInt32),
		echotimes = fread(64, Float32),
		asl_perf_weighted_scale = read1(Int16),
		echo_pc_extra_frames_bot = read1(UInt16),
		echo_pc_ctrl = read1(UInt32),
		echo_pc_ylines = read1(UInt16),
		echo_pc_primary_yfirst = read1(UInt16),
		echo_pc_reverse_yfirst = read1(UInt16),
		echo_pc_zlines = read1(UInt16),
		echo_pc_yxfitorder = read1(UInt16),
		channel_combine_filter_type = read1(Int16),
		mavric_control = read1(UInt32),
		mavric_ImageType = read1(UInt32),
		mavric_bin_separation = read1(Int32),
		mavric_b0_offset = fread(40, Float32),
		channel_combine_filter_width = read1(Float32),
		channel_combine_filter_beta = read1(Float32),
		low_pass_nex_filter_width = read1(Float32),
		aps_tg_status = read1(UInt32),
		cal_pass_set_vector = read1(Int32),
		cal_nex_vector = read1(Int32),
		cal_weight_vector = read1(Int32),
		pure_filtering_mode = read1(Int32),
		pure_lambda = read1(Float32),
		pure_tuning_factor_surface = read1(Float32),
		pure_tuning_factor_body = read1(Float32),
		pure_derived_cal_fraction = read1(Float32),
		pure_derived_cal_reapodization = read1(Float32),
		noncart_grid_factor = read1(Float32),
		noncart_dual_traj = read1(Int32),
		noncart_traj_kmax_ratio = read1(Int32),
		noncart_traj_merge_start = read1(Int32),
		noncart_traj_merge_end = read1(Int32),
		oversamplingfactor = read1(Float32),
		nspokes_highres = read1(Int32),
		nspokes_lowres = read1(Int32),
		nrefslices = read1(Int32),
		psmde_pixel_offset = read1(Int32),
		hoecc = read1(Int32),
		hoec_fit_order = read1(Int32),
		esp = read1(Int32),
		viewSharing3D = read1(UInt32),
		gradwarp_interp_type = read1(Int32),
		pure_blur_enable = read1(Int32),
		pure_blur = read1(Float32),
		slice_info_tab_checksum = read1(UInt32),
		mb_factor = read1(UInt32),
		mb_slice_fov_shift_factor = read1(UInt32),
		mb_slice_order_sign = read1(Int32),
		cal_options = read1(UInt32),
		cs_factor = read1(Float32),
		cs_flag = read1(Int32),
		cs_maxiter = read1(Int32),
		cs_consistency = read1(Float32),
		cs_ph_stride = read1(Int32),
		cs_sl_stride = read1(Int32),
		noncart_traj_mode = read1(Int32),
		pure_alpha = read1(Float32),
		pure_otsu_class = read1(Int32),
		pure_exp_wt = read1(Float32),
		pure_erode_dist = read1(Int32),
		pure_dilate_dist = read1(Int32),
		pure_aniso_blur = read1(Int32),
		pure_aniso_erode_dist = read1(Int32),
		pure_aniso_dilate_dist = read1(Int32),
		calmode = read1(Int32),
		cine_ctrl = read1(UInt16),
		cine_ncycles = read1(UInt16),
		cine_recon_phases = read1(UInt16),
		cine_acq_phases = read1(UInt16),
		cine_virtual_coils = read1(UInt16),
		cine_nrejects = read1(UInt16),
		cine_low_rr = read1(UInt16),
		cine_high_rr = read1(UInt16),
		cine_avg_rr = read1(UInt16),
		cine_bpm = read1(UInt16),
		kat_arc_cal_size_ky = read1(UInt16),
		kat_arc_cal_size_kz = read1(UInt16),
		kat_arc_accel_outer = read1(UInt16),
		kat_arc_accel_center = read1(UInt16),
		cardt1map_ctrl = read1(UInt16),
		cardt1map_ti = read1(UInt16),
		propellerCtrl = read1(Int32),
		daviewsPerBlade = read1(Int32),
		rotationThreshold = read1(Float32),
		shiftThreshold = read1(Float32),
		correlationThreshold = read1(Float32),
		npwfactor = read1(Float32),
		viewshd_num = read1(Int32),
		bvalstab = fread(100, Float32),
		synbvalstab = fread(10, Float32),
		numsynbvals = read1(UInt16),
		position_detection = read1(UInt16),
		medal_param = read1(Float32),
		clariview_filter_x_nr_val = read1(UInt16),
		clariview_filter_x_sh_val = read1(UInt16),
		clariview_filter_x_is_factory = read1(UInt16),
		clariview_filter_x_option = read1(UInt16),
		grad_intensity_thres = read1(Float32),
		anne_mask_dilation_length = read1(Int32),
		anne_intensity_thres = read1(Float32),
		anne_channel_percentage = read1(Float32),
		ec3_iterations = read1(Int32),
		combined_coil_map_thres = read1(Float32),
		coil_map_smooth_factor = read1(Float32),
		coil_map_2_filter_width = read1(Float32),
		ec3_iteration_method = read1(Int32),
		img_ctrl = read1(Int32),
		moco_ctrl = read1(Int32),
		distcorr_ctrl = read1(Int32),
		distcorr_B0_filter_size = read1(Int32),
		distcorr_B0_filter_std_dev = read1(Float32),
		tensor_file_number = read1(Int32),
		muse = read1(UInt16),
		muse_nav = read1(UInt16),
		muse_nav_accel = read1(UInt16),
		muse_nav_hnover = read1(UInt16),
		muse_nav_yres = read1(UInt16),
		optimal_snr_noise_type = read1(UInt16),
		virtual_chan_policy = read1(UInt16),
		virtual_chan_sens_type = read1(UInt16),
		virtual_chan_apply_type = read1(UInt16),
		virtual_chan_uniformity_type = read1(UInt16),
		num_virtual_channels = read1(UInt16),
		excess = fread(507, Int16),
	)
end
