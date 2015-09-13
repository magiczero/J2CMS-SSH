package org.j2cms.web.action.manage.project;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Actions;
import org.apache.struts2.convention.annotation.ExceptionMapping;
import org.apache.struts2.convention.annotation.ExceptionMappings;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.j2cms.model.QueryResult;
import org.j2cms.model.box.Box;
import org.j2cms.model.project.Project;
import org.j2cms.model.user.User;
import org.j2cms.service.BoxService;
import org.j2cms.service.ProjectService;
import org.j2cms.utils.Struts2Utils;
import org.j2cms.web.action.EntityAction;

@Results({
	@Result(name="add",location = "add.jsp"),
	  @Result(name="list",location = "list.jsp")
})
@ExceptionMappings({
    @ExceptionMapping(exception = "java.sql.SQLException", result = "error", params = {"message", "操作数据库失败！"})
})
public class ProjectAction extends EntityAction<Project> {

	private static final long serialVersionUID = 3950852192684718198L;

	@Resource
	private ProjectService projectService;
	@Resource
	private BoxService boxService;
	
	private List<Box> listBox;
	
	private String projectid;
	
	private String message;
	
	private String update;
	
	private Project selector = new Project();
	
	private String sortType="id";//排序类型
	
	@Action(value="detail",results={@Result(name="success",location="detail.jsp",params={"message","${message}"})})
	public String detail() {
		selector = projectService.find(Integer.valueOf(projectid));
		
		return SUCCESS;
	}
	
	@Action(value="add",results={@Result(name="success",location="add1.jsp")})
	public String add() {
		listBox = boxService.getAll();
		
		return SUCCESS;
	}

//	@Actions({
//		@Action("list")
//	})
	@Action(value="list",results={@Result(name="success",params={"update","${update}"},location="list1.jsp")})
	public String list(){
		QueryResult<Project> qr;
		StringBuffer jpql = new StringBuffer("");
		List<Object> params = new ArrayList<Object>();
		
		if(selector!=null&&selector.getId()!=null){
			jpql.append(" o.id=?").append((params.size()+1));
			params.add(selector.getId());
			qr=projectService.getScrollData(0, 1,jpql.toString(), params.toArray());
		}
		else{
			int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();
		    LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
			orderby.put(sortType==null?"id":sortType, "desc");
			
			if(params.size()>0) jpql.append(" and ");
			jpql.append(" o.creator=?").append((params.size()+1));
			User user = (User)Struts2Utils.getSession().getAttribute("user");
			params.add(user);
			
			qr=projectService.getScrollData(firstindex, pageView.getMaxresult(),jpql.toString(), params.toArray(), orderby);
		}
		
		pageView.setQueryResult(qr);
		
		//	return "list";
		return SUCCESS;
				
	}
	
	@Actions({
		@Action(value="del",results={@Result(name="success",type="redirect",location="list")})
	})
	public String delete() {
		projectService.delete(Integer.parseInt(projectid));
		
		return SUCCESS;
	}
	
	@Actions({
		@Action(value="save",results={@Result(name="success",params={"update","true"},type="redirect",location="list"),@Result(name="error",type="redirect",location="detail",params={"message","${message}","projectid","${projectid}"})})
	})
	public String save() {
		message = "保存或修改未成功，请检查是否有未填项或联系管理员";
		try {
			if(checkEntityForm()) {
				
				if(selector.getId() == null) {
					User user = (User)Struts2Utils.getSession().getAttribute("user");
					selector.setCreator(user);
					projectService.save(selector);
					message = "保存成功";
				} else {
					Project pro = projectService.find(selector.getId());
					selector.setCreateTime(pro.getCreateTime());
					selector.setCreator(pro.getCreator());
					projectService.update(selector);
					message = "修改成功";
				}
				projectid = selector.getId().toString();
			} 
			return SUCCESS;
		} catch (Exception e) {
			message = "数据操作出现问题，请联系管理员";
			log.error("保存或修改项目失败");
			return ERROR;
		}
	}
	/*
	@Action(value="onajax",results={@Result(name="succ", type="json")})
	public String onAjax() {
		System.out.println(projectid);
		
		ajax = "{\"projectName\":\"abcdddd\"}";
		return "succ";
	}*/

	public Project getSelector() {
		return selector;
	}

	public void setSelector(Project selector) {
		this.selector = selector;
	}
	
	private boolean checkEntityForm() {
		if(selector.getName()==null||("").equals(selector.getName().trim())) 
		{
			Struts2Utils.setAttribute("message1", "项目名称不能为空！");
			return false;
		}
		
		if(selector.getProductName()==null||("").equals(selector.getProductName().trim())) 
		{
			Struts2Utils.setAttribute("message1", "产品名称不能为空！");
			return false;
		}
		return true;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public List<Box> getListBox() {
		return listBox;
	}

	public void setListBox(List<Box> listBox) {
		this.listBox = listBox;
	}

	public String getProjectid() {
		return projectid;
	}

	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}

	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public String getUpdate() {
		return update;
	}

	public void setUpdate(String update) {
		this.update = update;
	}

}
