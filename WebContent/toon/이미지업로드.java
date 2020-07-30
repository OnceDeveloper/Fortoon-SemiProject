	<td>
													<!--input box--> <input type="text" class="upload_text"
													readonly="readonly"> <!--button-->
													<div class="upload-btn_wrap">
														<button type="button" title="파일찾기">
															<span>파일찾기</span>
														</button>
														<input type="file" class="input_file" title="파일찾기">
													</div>
												</td>





ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
public ModelAndView updateBimg(Attachment pi,Member ti,Model model, HttpSession session, int CuNo, Attachment a, Attachment bi,
			HttpServletRequest request, Member m,
			@RequestParam(value = "banner", required = false) MultipartFile image) {
		ModelAndView mav = new ModelAndView();
		m = cs.selectmInfo(CuNo);// 채널 주인 정보 출력
		int ChNo = m.getChNo();// 채널 주인 채널 번호
		bi = cs.selectbInfo(m.getChNo()); // 채널 프로필 정보 출력
		pi = cs.selectpInfo(m.getChNo()); // 채널 프로필 정보 출력
		if (pi != null) {
			String ext2 = pi.getAtName().substring(pi.getAtName().lastIndexOf("."));
			mav.addObject("ext2", ext2);
			mav.addObject("pi", pi);
		}
		ti = cs.selecttInfo(m.getChNo());// 제목 정보 출력
		if (ti != null) {
			mav.addObject("title", ti.getChName());
		}

		String root = request.getSession().getServletContext().getRealPath("resources");
		String filePath = root + "\\uploadFiles\\banner";
		

		String originFileName = image.getOriginalFilename();
		String ext = originFileName.substring(originFileName.lastIndexOf("."));

		// 사진 형식이 아닐시 alert전송-------------------------
		if (!ext.equals(".jpg") && !ext.equals(".png") && !ext.equals(".jpeg")) {
			
			if (pi != null) {
				String ext2 = pi.getAtName().substring(pi.getAtName().lastIndexOf("."));
				mav.addObject("ext2", ext2);
				mav.addObject("pi", pi);
			}
			if (ti != null) {
				mav.addObject("title", ti.getChName());
			}
			
			
			mav.addObject("msg", "사진이 아닌 파일입니다.(jpg,png.jpeg)");
			mav.setViewName("channel_admin/bannerAndProfile");
			mav.addObject("m", m);
			return mav;
		}
		// -------------------------------------

		String changeName = CommonUtils.getRandomString();

		try {
			image.transferTo(new File(filePath + "\\" + changeName + ext));

			a.setAtName(originFileName);// 원본이름
			a.setAtMName(changeName);// 바뀐이름
			a.setAtPath(filePath);// 파일경로
			a.setAtCHno(ChNo);// 채널 번호

			if (bi == null) {// 전에 추가한 이력이 없는 경우
				int result = cs.insertBimg(a);
				System.out.println("베너 삽입  : " + result);

			} else {// 전에 추가한 이력이 있는 경우
				cs.updateBimg(a);
				System.out.println("베너 삽입  : " + cs.updateBimg(a));
			}
			
			String ext3 = bi.getAtName().substring(bi.getAtName().lastIndexOf("."));
			mav.addObject("ext3", ext3);//아래 출력되는 베너 사진
			mav.addObject("a", a);
			mav.addObject("pi", bi);
			mav.addObject("m", m);
			mav.addObject("ext", ext);
			mav.setViewName("channel_admin/bannerAndProfile");
			String ext2 = pi.getAtName().substring(pi.getAtName().lastIndexOf("."));
			mav.addObject("ext2", ext2);
			mav.addObject("pi", pi);
		} catch (Exception e) {

			new File(filePath + "\\" + changeName + ext).delete();

			model.addAttribute("msg", "베너 업로드 실패");
			mav.setViewName("common/errorPage");
			return mav;
		}
		return mav;
	}


