package org.j2cms.web.action.manage.schemetable;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.j2cms.model.QueryResult;
import org.j2cms.model.schemetable.SchemeTable;
import org.j2cms.service.SchemeTableService;
import org.j2cms.web.action.EntityAction;

@ParentPackage(value="json-default")
public class SchemeTableAction extends EntityAction<SchemeTable> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 6996776288464453280L;

	@Resource
	private SchemeTableService stService;
	
	private SchemeTable st;
	
	private Double lower;			//	最顶可接受值

	private Double productor;
	
	private Double use;
	
	private Double diffratio;
	
	private Integer truncation;			//截尾数 == productor2
	
	private double multiple;
	
	private int typeid;
	
	private int subtype;
	
	private String schemeAjax;
	
	@Action(value="queryScheme",results={@Result(name="success", location="query.jsp"),@Result(name="success3", location="query345.jsp")})
	public String list() {
		QueryResult<SchemeTable> qr;
		StringBuffer jpql = new StringBuffer("");// "1=1"?
		List<Integer> params = new ArrayList<Integer>();

		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id", "asc");

		if(typeid==12) {
			jpql.append(" o.type in (?1, ?2)");
			params.add(1);
			params.add(2);
		} else if(typeid==31) {
			jpql.append(" o.type = ?1");
			params.add(3);
			subtype = 10;
		} else if(typeid==32) {
			jpql.append(" o.type = ?1");
			params.add(4);
			subtype=20;
		} else if(typeid==33) {
			jpql.append(" o.type = ?1");
			params.add(5);
			subtype=30;
		}

		qr = entityService.getScrollData(-1,-1,	jpql.toString(), params.toArray(), orderby);
		
		pageView.setQueryResult(qr);
		
		if(typeid==12)
			return SUCCESS;
		else if(typeid==31 || typeid==32 || typeid==33)
			return "success3";
		else
			return null;
	}
	
	@Action(value="queryDingshuScheme",results={@Result(name="success", location="query2.jsp")})
	public String queryDingshu() {
		
			return SUCCESS;
	}
	
	@Action(value="queryXuguanScheme",results={@Result(name="success", location="query78.jsp")})
	public String queryXuguan() {
		
			return SUCCESS;
	}
	
	@Action(value="getDingshi1",results={@Result(name="success", type="json", params={"root","st"})})
	public String ajaxDingshi1() {
		st = stService.getSchemeByMinDingshi(multiple);
		
		return SUCCESS;
	}
	
	@Action(value="getErXiangDingshu1",results={@Result(name="success", type="json", params={"root","schemeAjax"})})
	public String getEXDS1() {			//二项定数
		double p0 = 1.0d-lower;
		double p1 = diffratio * p0;
		
		
		return SUCCESS;
	}
	
	@Action(value="getDingshi2",results={@Result(name="success", type="json", params={"root","schemeAjax"})})
	public String ajaxDingshi2() {
		List<SchemeTable> schemeList = stService.schemeList(productor, use);
		schemeAjax = "[";
		for(SchemeTable sct : schemeList) {
			schemeAjax += "{\"schemeNum\":\""+sct.getSchemeNum()+"\",\"pro1\":\""+sct.getProductor1()+"\",\"use1\":\""+sct.getUse1()+"\",\"pro2\":\""+sct.getProductor2()+"\",\"use2\":\""+sct.getUse2()+"\",\"dr\":\""+sct.getDiffRatio()+"\","
					+ "\"testTime\":\""+sct.getTestTime()+"\",\"rejection\":\""+sct.getRejection()+"\",\"receive\":\""+sct.getReceive()+"\"},";
		}
		schemeAjax.substring(0, schemeAjax.length()-1);
		schemeAjax += "]";
		return SUCCESS;
	}
	
	@Action(value="getDingshi",results={@Result(name="success", type="json", params={"root","st"})})
	public String onAjax() {
		QueryResult<SchemeTable> qr;
		StringBuffer jpql = new StringBuffer("");// "1=1"?
		List<Object> params = new ArrayList<Object>();

		int firstindex = (pageView.getCurrentpage() - 1)
				* pageView.getMaxresult();
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id","desc");

		if (params.size() > 0)
			jpql.append(" and ");
		jpql.append(" o.productor1=?").append(params.size() + 1);
		params.add(productor);

		if (params.size() > 0)
			jpql.append(" and ");
		jpql.append(" o.use1=?").append(params.size() + 1);
		params.add(use);

		if (params.size() > 0)
			jpql.append(" and ");
		jpql.append(" o.diffRatio=?").append(params.size() + 1);
		params.add(diffratio);
		
		if (params.size() > 0)
			jpql.append(" and ");
		jpql.append(" o.type in (?4, ?5)");
		params.add(1);
		params.add(2);

		qr = entityService.getScrollData(firstindex, pageView.getMaxresult(),
				jpql.toString(), params.toArray(), orderby);

		if (qr.getTotalrecord() > 0)
		st = qr.getResultlist().get(0);
		
		return SUCCESS;
	}
	
	@Action(value="getDingshu",results={@Result(name="success", type="json", params={"root","schemeAjax"})})
	public String onAjax2() {
		typeid = 6;			//定数类别
		QueryResult<SchemeTable> qr;
		StringBuffer jpql = new StringBuffer("");// "1=1"?
		List<Object> params = new ArrayList<Object>();
		
		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id","desc");

		if(productor != null) {
			if (params.size() > 0)	jpql.append(" and ");
			jpql.append(" o.productor1=?").append(params.size() + 1);
			params.add(productor);
		}

		if(use != null) {
			if (params.size() > 0)	jpql.append(" and ");
			jpql.append(" o.use1=?").append(params.size() + 1);
			params.add(use);
		}

		
		if(diffratio != null) {
			if (params.size() > 0)  jpql.append(" and ");
			jpql.append(" o.diffRatio=?").append(params.size() + 1);
			params.add(diffratio);
		}
		
		if(truncation != null) {
			if(params.size() > 0) jpql.append(" and ");
			jpql.append(" o.productor2=?").append(params.size()+1);
			params.add(truncation);
		}
		
		if (params.size() > 0)
			jpql.append(" and ");
		jpql.append(" o.type=?").append(params.size() + 1);
		params.add(typeid);

		qr = entityService.getScrollData(-1, -1, jpql.toString(), params.toArray(), orderby);

		if (qr.getTotalrecord() > 0) {
			schemeAjax = "[";
			for(SchemeTable sct : qr.getResultlist()) {
				schemeAjax += "{\"pro1\":\""+sct.getProductor1()+"\",\"use1\":\""+sct.getUse1()+"\",\"trun\":\""+sct.getProductor2().intValue()+"\",\"dr\":\""+sct.getDiffRatio()+"\","
						+ "\"times\":\""+sct.getUse2()+"\"},";
			}
			schemeAjax.substring(0, schemeAjax.length()-1);
			schemeAjax += "]";
		}
		
		return SUCCESS;
	}
	
	@Action(value="getXuguan",results={@Result(name="success", type="json", params={"root","schemeAjax"})})
	public String onAjax3() {
		typeid=7;
		QueryResult<SchemeTable> qr;
		StringBuffer jpql = new StringBuffer("");// "1=1"?
		List<Object> params = new ArrayList<Object>();

		LinkedHashMap<String, String> orderby = new LinkedHashMap<String, String>();
		orderby.put("id","desc");

		if(productor != null) {
			if (params.size() > 0)
				jpql.append(" and ");
			jpql.append(" o.productor1=?").append(params.size() + 1);
			params.add(productor);
		}

		if(use != null) {
			if (params.size() > 0)
				jpql.append(" and ");
			jpql.append(" o.use1=?").append(params.size() + 1);
			params.add(use);
		}

		if(diffratio !=null) {
			if (params.size() > 0)
				jpql.append(" and ");
			jpql.append(" o.diffRatio=?").append(params.size() + 1);
			params.add(diffratio);
		}
		
		if (params.size() > 0)
			jpql.append(" and ");
		jpql.append(" o.type=?").append(params.size() + 1);
		params.add(typeid);

		qr = entityService.getScrollData(-1, -1,  jpql.toString(), params.toArray(), orderby);

		if (qr.getTotalrecord() > 0) {
			schemeAjax = "[";
			for(SchemeTable sct : qr.getResultlist()) {
				schemeAjax += "{\"schemeNum\":\""+sct.getSchemeNum()+"\",\"pro1\":\""+sct.getProductor1()+"\",\"use1\":\""+sct.getUse1()+"\",\"pro2\":\""+sct.getProductor2()+"\",\"use2\":\""+sct.getUse2()+"\",\"dr\":\""+sct.getDiffRatio()+"\"},";
			}
			schemeAjax.substring(0, schemeAjax.length()-1);
			schemeAjax += "]";
		}
		
		return SUCCESS;
	}
	
	@Action(value="getPJBZ",results={@Result(name="success", params={"typeid", "${typeid}"}, location="query77.jsp")})
	public String panjuebiaozhun() {			//判决标准
		if(typeid>0 && typeid<9)
			return SUCCESS;
		
		return ERROR;
	}

	public Double getProductor() {
		return productor;
	}

	public void setProductor(Double productor) {
		this.productor = productor;
	}

	public Double getUse() {
		return use;
	}

	public void setUse(Double use) {
		this.use = use;
	}

	public Double getDiffratio() {
		return diffratio;
	}

	public void setDiffratio(Double diffratio) {
		this.diffratio = diffratio;
	}
	
	public SchemeTable getSt() {
		return st;
	}

	public void setSt(SchemeTable st) {
		this.st = st;
	}

	public int getTypeid() {
		return typeid;
	}

	public void setTypeid(int typeid) {
		this.typeid = typeid;
	}
	

	public double getMultiple() {
		return multiple;
	}

	public void setMultiple(double multiple) {
		this.multiple = multiple;
	}

	public String getSchemeAjax() {
		return schemeAjax;
	}

	public void setSchemeAjax(String schemeAjax) {
		this.schemeAjax = schemeAjax;
	}
	
	public int getSubtype() {
		return subtype;
	}

	public void setSubtype(int subtype) {
		this.subtype = subtype;
	}

	public Integer getTruncation() {
		return truncation;
	}

	public void setTruncation(Integer truncation) {
		this.truncation = truncation;
	}

	public Double getLower() {
		return lower;
	}

	public void setLower(Double lower) {
		this.lower = lower;
	}

}
