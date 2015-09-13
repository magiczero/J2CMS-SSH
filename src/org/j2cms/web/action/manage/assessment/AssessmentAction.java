package org.j2cms.web.action.manage.assessment;

import java.util.ArrayList;

import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.j2cms.model.QueryResult;
import org.j2cms.model.assessment.Assessment;
import org.j2cms.model.project.Project;
import org.j2cms.service.AssessmentService;
import org.j2cms.service.ProjectService;
import org.j2cms.web.action.EntityAction;

@Result(name="error",type="freemarker",location="/WEB-INF/content/util/error.ftl")
public class AssessmentAction extends EntityAction<Assessment> {

	private static final long serialVersionUID = -3512089189965595951L;

	@Resource
	private AssessmentService assessService;
	
	@Resource
	private ProjectService projectService;
	
	private Project project1;

	private String update;
	
	private String projectid;
	
	private Integer assessId;

	private Assessment selector;
	
	@Action(value="add",results={@Result(name="add",location="add1.jsp",params={"update","${update}"})})
	public String add() {
		//selector = assessService.getAemByProjectId(Integer.parseInt(projectid));
		
		if(assessId == null) {
			selector = new Assessment();
			
			selector.setProject(projectService.find(Integer.parseInt(projectid)));
		} else {
			selector = assessService.find(assessId);
		}
		
		projectid = selector.getProject().getId().toString();
		
		return "add";
	}
	
	@Action(value="save",results={@Result(name="success",params={"projectid", "${selector.project.id}","update","true"}, location="list",type = "redirect")})
	public String save() {
		if(selector.getId() == null)
			assessService.save(selector);
		else
			assessService.update(selector);
		
		return SUCCESS;
	}
	
	@Action(value="edit",results={@Result(name="success",location="add1.jsp",params={"update","${update}"})})
	public String edit() {
		selector = assessService.find(assessId);
		project1 = selector.getProject();
		projectid = project1.getId().toString();
		return SUCCESS;
	}
	
	@Action(value="del",results={@Result(name="success",params={"projectid", "${selector.project.id}"}, location="list",type = "redirect")})
	public String del() {
		selector = assessService.find(assessId);
		
		if(selector == null) return ERROR;
		assessService.delete(selector.getId());
		
		return SUCCESS;
	}
	
	@Action(value="list",results={@Result(name="success", location="list.jsp")})
	public String list() {
		project1 = projectService.find(Integer.valueOf(projectid));
		
		if(project1 == null) return "";
		QueryResult<Assessment> qr;
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
	
	@Action(value="detail",results={@Result(name="success",location="add1.jsp")})
	public String detail() {
		selector = assessService.find(assessId);
		project1 = selector.getProject();
		projectid = project1.getId().toString();
		return "detail";
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

	public Assessment getSelector() {
		return selector;
	}

	public void setSelector(Assessment selector) {
		this.selector = selector;
	}

	public Project getProject1() {
		return project1;
	}

	public void setProject1(Project project1) {
		this.project1 = project1;
	}

	public Integer getAssessId() {
		return assessId;
	}

	public void setAssessId(Integer assessId) {
		this.assessId = assessId;
	}
}
