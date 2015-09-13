package org.j2cms.web.action.manage.scheme;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.j2cms.model.QueryResult;
import org.j2cms.model.project.Project;
import org.j2cms.model.scheme.Scheme;
import org.j2cms.service.ProjectService;
import org.j2cms.service.SchemeService;
import org.j2cms.web.action.EntityAction;

public class SchemeAction extends EntityAction<Scheme> {

	private static final long serialVersionUID = -5667384235105256110L;

	@Resource
	private SchemeService schemeService;
	
	@Resource
	private ProjectService projectService;
	
	private Project project1;

	private String projectid;
	
	private Integer schemeid;

	private String update;

	private Scheme selector ;
	
	/*
	@Action(value = "right", results = {
			@Result(name = "add", location = "/manage/scheme/add", params={"projectid", "${projectid}"}, type = "redirect"),
			@Result(name = "detail", location = "/manage/scheme/detail", params={"projectid", "${projectid}"}, type = "redirect") })
	public String right() {
		selector = schemeService.getSchemeByProjectId(Integer.valueOf(projectid));

		if (selector == null) {
			selector = new Scheme();
			selector.setProject(projectService.find(Integer.valueOf(projectid)));
		}
		
		return "add";

		//return "detail";
	} */

/*	@Action(value="add",results={@Result(name="add",location="add.jsp",params={"update","${update}"}),@Result(name="add2",location="add2.jsp",params={"update","${update}"})})
	public String add() {
		project1 = projectService.find(Integer.valueOf(projectid));
		
		if(selector == null) {
			selector = new Scheme();
		} 
		
		selector.setProject(project1);
		
		//if(project.getTestScheme())
			return "add";
//		else
//			return "add2";
	}*/
	
	@Action(value="save",results={@Result(name="success",params={"projectid", "${selector.project.id}","update","true"}, location="/manage/scheme/list",type = "redirect")})
	public String save() {
		if(selector.getId() == null) 
			schemeService.save(selector);
		else
			schemeService.update(selector);
		
		return SUCCESS;
	}
	
	@Action(value="detail",results={@Result(name="success",location="detail1.jsp")})
	public String detail() {
		selector = schemeService.find(schemeid);
		
		return SUCCESS;
	}
	
	@Action(value="add3",results={@Result(name="success",location="detail1.jsp")})
	public String add3() {
		project1 = projectService.find(Integer.valueOf(projectid));
		selector = new Scheme();
		selector.setProject(project1);
		
		return SUCCESS;
	}
	
	@Action(value="edit",results={@Result(name="success",location="detail1.jsp")})
	public String edit() {
		selector = schemeService.find(schemeid);
		project1 = selector.getProject();
		
		return SUCCESS;
	}
	
	@Action(value="list",results={@Result(name="success",params={"update","${update}"},location="list.jsp")})
	public String list() {
		project1 = projectService.find(Integer.valueOf(projectid));
		
		if(project1 == null) return "";
		QueryResult<Scheme> qr;
		StringBuffer jpql = new StringBuffer("");//"1=1"?
		List<Object> params = new ArrayList<Object>();
		
	    LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "desc");
		
		if(projectid != null) {
			jpql.append(" o.project.id=?").append((params.size()+1));
			params.add(project1.getId());
		}
		
		qr=entityService.getScrollData(-1, -1,jpql.toString(), params.toArray(), orderby);
		
		pageView.setQueryResult(qr);
		
		return SUCCESS;
	}
	
	@Action(value="del",results={@Result(name="success",params={"projectid", "${project1.id}","update","true"},location="list",type = "redirect")})
	public String del() {
		selector = schemeService.find(schemeid);
		
		if(selector == null)
			return ERROR;
		
		project1 = selector.getProject();
		schemeService.delete(schemeid);
		return SUCCESS;
	}
	

	public String getUpdate() {
		return update;
	}

	public void setUpdate(String update) {
		this.update = update;
	}

	public String getProjectid() {
		return projectid;
	}

	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	
	public Scheme getSelector() {
		return selector;
	}

	public void setSelector(Scheme selector) {
		this.selector = selector;
	}

	public Project getProject1() {
		return project1;
	}

	public void setProject1(Project project1) {
		this.project1 = project1;
	}
	
	public Integer getSchemeid() {
		return schemeid;
	}

	public void setSchemeid(Integer schemeid) {
		this.schemeid = schemeid;
	}
}
