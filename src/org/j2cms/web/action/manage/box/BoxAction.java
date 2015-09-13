package org.j2cms.web.action.manage.box;

import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.j2cms.model.assessment.Assessment;
import org.j2cms.model.box.Box;
import org.j2cms.model.project.Project;
import org.j2cms.model.scheme.Scheme;
import org.j2cms.model.testdata.TestData;
import org.j2cms.model.user.User;
import org.j2cms.service.BoxService;
import org.j2cms.utils.Struts2Utils;
import org.j2cms.web.action.EntityAction;

@ParentPackage(value="json-default")
public class BoxAction extends EntityAction<Box> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7047878742826560123L;
	
	@Resource
	private BoxService boxService;
	
	private String ztree;
	
	private List<Box> listBox;
	
	@Action(value="list",results={@Result(name="success",location="list.jsp")})
	public String list() {
		listBox = boxService.getAll();
		
		return SUCCESS;
	}
	
	@Action(value="add",results={@Result(name="success",location="add.jsp")})
	public String add() {
		
		return SUCCESS;
	}
	
	@Action(value="save",results={@Result(name="success",location="list",type="redirect")})
	public String save() {
		super.save();
		return SUCCESS;
	}
	
	@Action(value="listTree",results={@Result(name="success", type="json", params={"root","ztree"})})
	public String listAjax() {
		User user = (User)Struts2Utils.getSession().getAttribute("user");
		
		List<Box> list = boxService.getAll();
		
		StringBuffer sb = new StringBuffer("[");
		
		for(Box box : list) {
			String boxId = box.getId().toString();
			sb.append("{\"id\":\""+boxId+"\", \"pId\":\"0\", \"name\":\""+box.getName()+"\"},");		//盒子（项目）
			for(Project project : box.getProjects()) {
				if(project.getCreator().getId().intValue()==user.getId().intValue()) {
					String pid = boxId + project.getId();
					sb.append("{\"id\":\""+pid+"\", \"pId\":\""+box.getId()+"\", \"name\":\""+project.getName()+"\",\"url\":\"manage/project/detail?projectid="+project.getId()+"\", \"target\":\"rightFrame\"},");		//试验信息
					//试验方案id
					String schemeId = pid + "1";
					sb.append("{\"id\":\""+schemeId+"\", \"pId\":\""+pid+"\", \"name\":\"试验方案设计\",\"url\":\"manage/scheme/list?projectid="+project.getId()+"\", \"target\":\"rightFrame\"},");
					for(Scheme scheme : project.getSchemes()){
						String sid = schemeId + scheme.getId();
						sb.append("{\"id\":\""+sid+"\", \"pId\":\""+schemeId+"\", \"name\":\""+scheme.getSchemeName()+"\",\"url\":\"manage/scheme/detail?schemeid="+scheme.getId()+"\", \"target\":\"rightFrame\"},");
					}
					//试验数据
					String dataId = pid + "2";
					sb.append("{\"id\":\""+dataId+"\", \"pId\":\""+pid+"\", \"name\":\"试验数据管理\",\"url\":\"manage/testdata/list?projectid="+project.getId()+"\", \"target\":\"rightFrame\"},");
					for(TestData data : project.getDatas()) {
						String did = dataId + data.getId();
						sb.append("{\"id\":\""+did+"\", \"pId\":\""+dataId+"\", \"name\":\""+data.getDataName()+"\",\"url\":\"manage/testdata/detail?dataid="+data.getId()+"\", \"target\":\"rightFrame\"},");
					}
					//评估结果
					String assessmentId = pid + "3";
					sb.append("{\"id\":\""+assessmentId+"\", \"pId\":\""+pid+"\", \"name\":\"可靠性评估\",\"url\":\"manage/assessment/list?projectid="+project.getId()+"\", \"target\":\"rightFrame\"},");
					for(Assessment asm : project.getAssessments()) {
						sb.append("{\"id\":\""+(assessmentId+asm.getId())+"\", \"pId\":\""+assessmentId+"\", \"name\":\""+asm.getName()+"\",\"url\":\"manage/assessment/detail?asmid="+asm.getId()+"\", \"target\":\"rightFrame\"},");
					}
				}
			}
		}
		
		ztree = sb.substring(0, sb.length()-1) + "]";
		
		return SUCCESS;
	}
	
	public String getZtree() {
		return ztree;
	}

	public void setZtree(String ztree) {
		this.ztree = ztree;
	}

	public List<Box> getListBox() {
		return listBox;
	}

	public void setListBox(List<Box> listBox) {
		this.listBox = listBox;
	}

}
