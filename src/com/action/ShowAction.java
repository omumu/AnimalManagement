package com.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;

import com.dao.ShowDao;
import com.model.Show;
import com.model.TUser;
import com.opensymphony.xwork2.ActionSupport;
import com.util.StringUtil;


public class ShowAction extends ActionSupport {
	private Integer page;
	private ShowDao showDao = new ShowDao();
	private String showTitle;
	private Integer showId;
	
	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getShowId() {
		return showId;
	}

	public void setShowId(Integer showId) {
		this.showId = showId;
	}

	public String getShowTitle() {
		return showTitle;
	}

	public void setShowTitle(String showTitle) {
		this.showTitle = showTitle;
	}

	private File file;
	// 文件名
	private String fileFileName;
	// 文件 类型
	private String fileContentType;

	public String getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}

	public String getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}

	public File getFile() {
		return file;
	}

	public void setFile(File file) {
		this.file = file;
	}

	public String preShow() {
		TUser user = (TUser) ServletActionContext.getRequest().getSession().getAttribute("user"); // 获取session中的user
		if (user == null) {// 用户未登录
			return "no_login";
		}
		return "success";
	}

	public String addShow() throws Exception {
//		System.out.println(showTitle);
//		System.out.println("fileName:" + fileFileName);
		if (showTitle == null || "".equals(showTitle)) {
			ServletActionContext.getRequest().setAttribute("errorMsg", "标题不能为空！");
			return "errorArg";
		}
		if (fileFileName == null) {
			ServletActionContext.getRequest().setAttribute("errorMsg", "文件不能为空！");
			return "errorArg";
		}

//		System.out.println(fileContentType);//
		if (fileContentType == null || (!("video/mp4".equals(fileContentType)))) {
			ServletActionContext.getRequest().setAttribute("errorMsg", "文件类型错误");
			return "errorArg";
		}
		String fileFileNameAfter = System.currentTimeMillis()
				+ (fileFileName.substring(fileFileName.lastIndexOf("."), fileFileName.length()));
//		System.out.println(fileFileNameAfter);// 修改文件名
		String root = ServletActionContext.getServletContext().getRealPath("/show");
		File rootfile = new File(root);
		if (!rootfile.exists()) {// 如果文件夹不存在则创建这个文件夹
			rootfile.mkdirs();
		}
//		System.out.println(rootfile.getAbsolutePath());
		InputStream is = new FileInputStream(file);
		OutputStream os = new FileOutputStream(new File(root, fileFileNameAfter));
		byte[] buffer = new byte[2048]; // 缓冲区
		int length = 0;
		while (-1 != (length = is.read(buffer, 0, buffer.length))) {
			os.write(buffer);
		}
		os.close();
		is.close();
		Show s = new Show();
		s.setShowFileName(fileFileNameAfter);
		s.setShowTitle(showTitle);
		TUser user = (TUser) ServletActionContext.getRequest().getSession().getAttribute("user");
		s.setShowUser(user.getUserId());
		if (!showDao.addShow(s)) {
			throw new Exception("添加视频错误");
		}
		return "success";

	}

	public String showList() throws Exception {
		if (page == null) {
			page = 1;
		}
		int start = (page - 1) * 6;
		List<Show> sList = showDao.getShowList(start);

		// System.out.println(sList.size());
		ServletActionContext.getRequest().setAttribute("sList", sList);

		Integer totalNums = showDao.getShowListNums();
		HttpServletRequest request=ServletActionContext.getRequest();
		String pageCode = StringUtil.getPageCode("zhiyuan/showList.action", totalNums, 6, page);
//		System.out.println(pageCode);
		ServletActionContext.getRequest().setAttribute("pageCode", pageCode);
		ServletActionContext.getRequest().setAttribute("page", page);
		TUser user=(TUser)ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user==null){
			if (sList != null || sList.size() != 0) {
				for (Show s : sList) {
					
					
						s.setLikeState(0);
				

				}
			}
		}else{
			if (sList != null || sList.size() != 0) {
				for (Show s : sList) {
					if (showDao.isStarShow(user.getUserId(), s.getShowId())) {
						s.setLikeState(1);
					} else {
						s.setLikeState(0);
					}

				}
			}
		}
		
		// System.out.println(sList);
		return "success";
	}
	public String starShow() throws Exception{
		TUser user = (TUser) ServletActionContext.getRequest().getSession().getAttribute("user");
		if(user==null){
			return "no_login";
		}
		if(page==null){
			page=1;
		}
		
//		System.out.println(page);
		
		if(!showDao.addStarShow(user.getUserId(), showId)){
			throw new Exception("点赞失败");
		}
		if(!showDao.updateShowStars(showId)){
			throw new Exception("加视频秀的点赞次数");
		}
//		System.out.println(page);
		ServletActionContext.getResponse().sendRedirect("/axcw/showList.action?page="+page);
		return null;
	}
	
}
