package org.j2cms.web.action.manage.ajax;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.json.annotations.JSON;
import org.j2cms.model.project.Project;
import org.j2cms.service.ProjectService;

@ParentPackage(value="json-default")
public class AjaxAction {
	
	@Resource
	private ProjectService projectService;

	private String ajax;
	
	private String projectid;
	
	public String getProjectid() {
		return projectid;
	}

	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}

	@JSON
	public String getAjax() {
		return ajax;
	}

	public void setAjax(String ajax) {
		this.ajax = ajax;
	}
	
	@Action(value="/onajax",results={@Result(name="succ", type="json")})
	public String onAjax() {
		Project project = projectService.find(Integer.valueOf(projectid));
		
		ajax = "[{\"accessPath\":\"\",\"checked\":false,\"delFlag\":0,\"parentID\":0,\"resourceCode\":\"\",\"resourceDesc\":\"\",\"resourceGrade\":2,\"resourceID\":"+project.getId()+",\"resourceName\":\""+project.getName()+"\",\"resourceOrder\":0,\"resourceType\":\"\"},"
				+ "{\"accessPath\":\"manage/scheme/add?projectid="+project.getId()+"\",\"checked\":true,\"delFlag\":0,\"parentID\":"+project.getId()+",\"resourceCode\":\"\",\"resourceDesc\":\"\",\"resourceGrade\":"+project.getId()+",\"resourceID\":16,\"resourceName\":\"试验方案\",\"resourceOrder\":0,\"resourceType\":\"\"},"
            +"{\"accessPath\":\"manage/testdata/list?projectid="+project.getId()+"\",\"checked\":false,\"delFlag\":0,\"parentID\":"+project.getId()+",\"resourceCode\":\"\",\"resourceDesc\":\"\",\"resourceGrade\":"+project.getId()+",\"resourceID\":24,\"resourceName\":\"试验数据\",\"resourceOrder\":0,\"resourceType\":\"\"},"
           +" {\"accessPath\":\"manage/assessment/add?projectid="+project.getId()+"\",\"checked\":false,\"delFlag\":0,\"parentID\":"+project.getId()+",\"resourceCode\":\"\",\"resourceDesc\":\"\",\"resourceGrade\":"+project.getId()+",\"resourceID\":34,\"resourceName\":\"评估结果\",\"resourceOrder\":0,\"resourceType\":\"\"},"
           +" {\"accessPath\":\"\",\"checked\":false,\"delFlag\":0,\"parentID\":0,\"resourceCode\":\"\",\"resourceDesc\":\"\",\"resourceGrade\":100000,\"resourceID\":33,\"resourceName\":\"工具\",\"resourceOrder\":0,\"resourceType\":\"\"},"
           +" {\"accessPath\":\"\",\"checked\":false,\"delFlag\":0,\"parentID\":33,\"resourceCode\":\"\",\"resourceDesc\":\"\",\"resourceGrade\":33,\"resourceID\":38,\"resourceName\":\"GJB899A试验方案查询\",\"resourceOrder\":0,\"resourceType\":\"\"},"
           +" {\"accessPath\":\"\",\"checked\":false,\"delFlag\":0,\"parentID\":33,\"resourceCode\":\"\",\"resourceDesc\":\"\",\"resourceGrade\":33,\"resourceID\":32,\"resourceName\":\"GB5080试验方案查询\",\"resourceOrder\":0,\"resourceType\":\"\"},"
           		+ " {\"accessPath\":\"#manage/schemetable/queryScheme.action?typeid=12\",\"checked\":false,\"delFlag\":0,\"parentID\":38,\"resourceCode\":\"\",\"resourceDesc\":\"\",\"resourceGrade\":38,\"resourceID\":36,\"resourceName\":\"指数分布定时截尾试验方案\",\"resourceOrder\":0,\"resourceType\":\"\"},"
           		+ " {\"accessPath\":\"#manage/schemetable/queryXuguanScheme.action\",\"checked\":false,\"delFlag\":0,\"parentID\":38,\"resourceCode\":\"\",\"resourceDesc\":\"\",\"resourceGrade\":38,\"resourceID\":37,\"resourceName\":\"指数分布序贯截尾试验方案\",\"resourceOrder\":0,\"resourceType\":\"\"}"
           		+ "]";
		
		return "succ";
	}
}
