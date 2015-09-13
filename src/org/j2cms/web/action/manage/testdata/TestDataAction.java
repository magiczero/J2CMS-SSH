package org.j2cms.web.action.manage.testdata;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.j2cms.model.QueryResult;
import org.j2cms.model.project.Project;
import org.j2cms.model.testdata.TestData;
import org.j2cms.service.ProjectService;
import org.j2cms.service.TestDataService;
import org.j2cms.web.action.EntityAction;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

public class TestDataAction extends EntityAction<TestData> {

	private static final long serialVersionUID = -4908636245723312666L;

	@Resource
	private TestDataService dataService;
	@Resource
	private ProjectService projectService;
	
	private Integer projectid;
	
	private Integer dataid;

	public Integer getDataid() {
		return dataid;
	}

	public void setDataid(Integer dataid) {
		this.dataid = dataid;
	}

	private TestData selector = new TestData();
	
	private Project project1;

	private String sortType="id";//排序类型

	private String sortord="desc";
	
	@Action(value="add", results={@Result(name="success",location="add1.jsp")})
	public String add() {
		project1 = projectService.find(projectid);
		selector.setProject(project1);
		
		return SUCCESS;
	}
	
	@Action(value="edit", results={@Result(name="success",location="add1.jsp")})
	public String edit() {
		selector = dataService.find(dataid);
		
		return SUCCESS;
	}
	
	@Action(value="save",results = {
			@Result(name = "toList", location = "/manage/testdata/list",params={"projectid", "${selector.project.id}"},  type = "redirect")})
	public String save() {
		System.out.println("aaaa");
		if(selector.getId()==null)
			dataService.save(selector);
		else
			dataService.update(selector);
		
		return "toList";
	}
	
	@Action(value="del",results = {
			@Result(name = "success", location = "/manage/testdata/list",params={"projectid", "${selector.project.id}"},  type = "redirect")})
	public String delete() {
		selector = dataService.find(dataid);
		
		dataService.delete(dataid);
		
		return SUCCESS;
	}
	
	//@Action("list")
	@Action(value="list",results = {@Result(name="success", location = "list1.jsp")})
	public String list() {
		project1 = projectService.find(Integer.valueOf(projectid));
		
		if(project1 == null) return "";
		QueryResult<TestData> qr;
		StringBuffer jpql = new StringBuffer("");//"1=1"?
		List<Object> params = new ArrayList<Object>();
		
		int firstindex = (pageView.getCurrentpage()-1)*pageView.getMaxresult();
	    LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put(sortType==null?"id":sortType, sortord);
		
		if(projectid != null) {
			jpql.append(" o.project.id=?").append((params.size()+1));
			params.add(project1.getId());
		}
		
		qr=entityService.getScrollData(firstindex, pageView.getMaxresult(),jpql.toString(), params.toArray(), orderby);
		
		pageView.setQueryResult(qr);
		
		return SUCCESS;
	}
	
	@InitBinder
	protected void initBinder(WebDataBinder binder) {
	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    binder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
	}

	public Integer getProjectid() {
		return projectid;
	}

	public void setProjectid(Integer projectid) {
		this.projectid = projectid;
	}
	
	public String getSortType() {
		return sortType;
	}

	public void setSortType(String sortType) {
		this.sortType = sortType;
	}

	public String getSortord() {
		return sortord;
	}

	public void setSortord(String sortord) {
		this.sortord = sortord;
	}

	public TestData getSelector() {
		return selector;
	}

	public void setSelector(TestData selector) {
		this.selector = selector;
	}
	

	public Project getProject1() {
		return project1;
	}

	public void setProject1(Project project1) {
		this.project1 = project1;
	}

}
